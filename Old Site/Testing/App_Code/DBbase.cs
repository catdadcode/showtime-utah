using System;
using System.Data.SqlClient;
using System.Data;

namespace Tools
{

	/// <summary>
	/// This is the base class for all database objects. It does all of the low level data access.
	/// it ensures that the same connection string is used to increase efficiency through connection pooling
	/// </summary>
	public abstract class DBbase
	{
		SqlConnection MyConn;
		System.Collections.Hashtable tran; 

		public DBbase(string ConnectionString)
		{
			//Creates a new connection to be used by calling Functions
			MyConn = new SqlConnection(ConnectionString);
			tran = new System.Collections.Hashtable();
		}
		/// <summary>
		/// procedure for getting return values from a query.
		/// </summary>
		/// <param name="StoredProcName"></param>
		/// <param name="Params"></param>
		/// <param name="returnType"></param>
		/// <param name="returnParamName"></param>
		/// <param name="returnParam"></param>
		/// <returns></returns>
		private object executeStoredProcedure(string StoredProcName, SqlParameter[] Params, SqlDbType returnType, string returnParamName, bool returnParam)
		{
			SqlCommand cmd = new SqlCommand(StoredProcName, MyConn);
			cmd.Parameters.Add("@" + returnParamName, returnType);
			if (returnParam)
				cmd.Parameters[0].Direction = ParameterDirection.ReturnValue;
			else
				cmd.Parameters[0].Direction = ParameterDirection.Output;
			if(Params != null)
			{
				for (int i =0; i<Params.Length; i++)
				{
					cmd.Parameters.Add(Params[i]);
				}
				cmd.CommandType = CommandType.StoredProcedure;
			}
			try
			{
				if (MyConn.State != ConnectionState.Open)
					MyConn.Open();
				//SqlCommandBuilder.DeriveParameters(cmd);
				cmd.ExecuteScalar();
				return (cmd.Parameters[0].Value);
			}

			catch (Exception ex)
			{
				throw ex;
			}
			finally
			{
				cmd.Parameters.Clear();
				cmd.Dispose();
				cmd = null;
				MyConn.Close();
			}
		}

		/// <summary>
		/// Executes a stored procedure and returns a paramater as an object that is of the type that you specify
		/// </summary>
		/// <param name="StoredProcName"></param>
		/// <param name="Params"></param>
		/// <param name="returnType"></param>
		/// <param name="returnParamName"></param>
		/// <returns></returns>
		protected object executeStoredProcedure(string StoredProcName, SqlParameter[] Params, SqlDbType returnType, string returnParamName)
		{
			return executeStoredProcedure( StoredProcName, Params, returnType, returnParamName,false);
		}

		/// <summary>
		/// Executes a stored procedure and whatever integer is after the return value
		/// </summary>
		/// <param name="StoredProcName">Name of stored procedure</param>
		/// <param name="Params">array of paramaters</param>
		/// <param name="returnType">type of sql data you are returning</param>
		/// <returns></returns>		
		protected int executeStoredProcedure(string StoredProcName, SqlParameter[] Params, SqlDbType returnType)
		{
			//return value is always false
			return (int)executeStoredProcedure( StoredProcName, Params, returnType, "Return_Value",true);
		}

		/// <summary>
		/// executes a stored procedure and returns a dataset
		/// </summary>
		/// <param name="StoredProcName">name of stored procedure</param>
		/// <param name="Params">array of parameters</param>
		/// <param name="dsName">name for dataset</param>
		/// <returns></returns>
		protected DataSet executeStoredProcedure(string StoredProcName, SqlParameter[] Params, string dsName)
		{
			SqlCommand cmd = new SqlCommand(StoredProcName,MyConn);

			if(Params != null)
			{
				for (int i =0; i<Params.Length; i++)
				{
					cmd.Parameters.Add(Params[i]);
				}
			}
			cmd.CommandType = CommandType.StoredProcedure;
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			if (dsName == "")
				ds.DataSetName = "NewDataSet";
			else
				ds.DataSetName = dsName;
			try
			{
				if (MyConn.State != ConnectionState.Open)
					MyConn.Open();
				da.Fill(ds);
				return(ds);
			}
			catch (Exception ex)
			{
				throw ex;
			}
			finally
			{
				da.Dispose();
				cmd.Parameters.Clear();
				cmd.Dispose();
				cmd = null;
				MyConn.Close();
			}
		}	
		/// <summary>
		/// executes a stored procedure and returns a datareader
		/// </summary>
		/// <param name="StoredProcName">name of stored procedure</param>
		/// <param name="Params">array of parameters</param>
		/// <returns>returns dataset from db</returns>
		protected SqlDataReader executeStoredProcedure(string StoredProcName, SqlParameter[] Params)
		{	
			SqlCommand cmd = new SqlCommand(StoredProcName,MyConn);

			if(Params != null)
			{
				for (int i =0; i<Params.Length; i++)
				{
					cmd.Parameters.Add(Params[i]);
				}
			}
			cmd.CommandType = CommandType.StoredProcedure;
			try
			{
				if (MyConn.State != ConnectionState.Open)
					MyConn.Open();
				return cmd.ExecuteReader(CommandBehavior.CloseConnection);
			}
			catch (Exception ex)
			{
				MyConn.Close();
				throw ex;
			}
			finally
			{
				cmd.Parameters.Clear();
				cmd.Dispose();
				cmd = null;
			
			}
			
		}	
		#region "Transactions"
		
		/// <summary>
		/// Runs a stored procedure with a transaction 
		/// Commit or Rollback must be called to close the connection.
		/// </summary>
		/// <param name="StoredProcName">name of stored procedure</param>
		/// <param name="Params">arrray of parameters</param>
		/// <param name="transactionName">unique name for transaction</param>
		/// <param name="iso">System.Data.IosolationLevel for transaction</param>
		/// <returns></returns>
		protected SqlDataReader executeStoredProcedure(string StoredProcName, SqlParameter[] Params,string transactionName,System.Data.IsolationLevel iso)
		{
			SqlCommand cmd = new SqlCommand(StoredProcName,MyConn);
			            
			if(Params != null)
			{
				for (int i =0; i<Params.Length; i++)
				{
					cmd.Parameters.Add(Params[i]);
				}
			}
			cmd.CommandType = CommandType.StoredProcedure;
		
			try
			{
				if (MyConn.State != ConnectionState.Open)
					MyConn.Open();
				if (!tran.ContainsKey(transactionName))
					tran.Add(transactionName, MyConn.BeginTransaction(transactionName));
				cmd.Transaction = ((SqlTransaction)(tran[transactionName]));
				return cmd.ExecuteReader();
			}
			catch (Exception ex )
			{
				throw ex;
			}
			finally
			{
				cmd.Parameters.Clear();
				cmd = null;
			}
		}

		/// <summary>
		/// Runs a stored procedure with a transaction 
		/// Commit or Rollback must be called to close the connection.
		/// </summary>
		/// <param name="StoredProcName">name of stored procedure</param>
		/// <param name="Params">arrray of parameters</param>
		/// <param name="dsName">Name of dataSet</param>
		/// <param name="transactionName">unique name for transaction</param>
		/// <param name="iso">System.Data.IosolationLevel for transaction</param>
		/// <returns></returns>
		protected DataSet executeStoredProcedure(string StoredProcName, SqlParameter[] Params, string dsName, string transactionName,System.Data.IsolationLevel iso)
		{
			SqlCommand cmd = new SqlCommand(StoredProcName,MyConn);
			            
			if(Params != null)
			{
				for (int i =0; i<Params.Length; i++)
				{
					cmd.Parameters.Add(Params[i]);
				}
			}
			cmd.CommandType = CommandType.StoredProcedure;
		
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			if (dsName == "")
				ds.DataSetName = "NewDataSet";
			else
				ds.DataSetName = dsName;
			try
			{
				if (MyConn.State != ConnectionState.Open)
					MyConn.Open();
				if (!tran.ContainsKey(transactionName))
					tran.Add(transactionName, MyConn.BeginTransaction(transactionName));
				cmd.Transaction = ((SqlTransaction)(tran[transactionName]));
				da.Fill(ds);
				return(ds);
			}
			catch (Exception ex )
			{
				throw ex;
			}
			finally
			{
				da = null;
				cmd.Parameters.Clear();
				cmd = null;
			}
		}

		
		/// <summary>
		///Runs a stored procedure with a transaction 
		/// Commit or Rollback must be called to close the connection.
		/// </summary>
		/// <param name="StoredProcName">name of stored procedure</param>
		/// <param name="Params">arrray of parameters</param>
		/// <param name="returnType">return type for data returned by stored procedure</param>
		/// <param name="transactionName">unique name for transaction</param>
		/// <param name="iso">System.Data.IosolationLevel for transaction</param>
		/// <returns></returns>
		protected object executeStoredProcedure(string StoredProcName, SqlParameter[] Params, SqlDbType returnType,string transactionName,System.Data.IsolationLevel iso)
		{
			SqlCommand cmd = new SqlCommand(StoredProcName,MyConn);
			cmd.Parameters.Add("@Return_Value", returnType);
			cmd.Parameters[0].Direction = ParameterDirection.ReturnValue;
			            
			if(Params != null)
			{
				for (int i =0; i<Params.Length; i++)
				{
					cmd.Parameters.Add(Params[i]);
				}
			}
			cmd.CommandType = CommandType.StoredProcedure;
		
			try
			{
				if (MyConn.State != ConnectionState.Open)
					MyConn.Open();
				if (!tran.ContainsKey(transactionName))
					tran.Add(transactionName, MyConn.BeginTransaction(transactionName));
				cmd.Transaction = ((SqlTransaction)(tran[transactionName]));
				cmd.ExecuteScalar();
				return (cmd.Parameters[0].Value);
			}
			catch (Exception ex )
			{
				throw ex;
			}
			finally
			{
				cmd.Parameters.Clear();
				cmd = null;
			}
		}


		/// <summary>
		/// commits a transaction and closes the connection
		/// </summary>
		/// <param name="transactionName"></param>
		/// <returns></returns>
		public bool commit(string transactionName)
		{
			try
			{
				((SqlTransaction)(tran[transactionName])).Commit();
				MyConn.Close();
				return true;
			}
			catch
			{
				return false;		
			}
			
		}
		/// <summary>
		/// rolls back a transaction and closes the connection
		/// </summary>
		/// <param name="transactionName"></param>
		/// <returns></returns>
		public bool rollBack(string transactionName)
		{
			try
			{
			
				((SqlTransaction)(tran[transactionName])).Rollback();
				MyConn.Close();
				return true;
			}
			catch
			{
				return false;		
			}
			
		}
		/// <summary>
		/// saves and labels a save point
		/// </summary>
		/// <param name="transactionName"></param>
		/// <param name="savePointName"></param>
		/// <returns></returns>
		public bool savePoint(string transactionName, string savePointName)
		{
			try
			{
				((SqlTransaction)(tran[transactionName])).Save(savePointName);
				return true;
			}
			catch
			{
				return false;		
			}
		}
		#endregion

		#region "Handle DB Values"
		/// <summary>
		/// returns an int, if there is a problem a invalid cast exception is thrown
		/// </summary>
		/// <param name="input"></param>
		/// <returns></returns>
		public int handleDBInt(object input)
		{
			return int.Parse(input.ToString());
		}

		/// <summary>
		/// returns an int, if there is a problem the default value is returned
		/// </summary>
		/// <param name="input"></param>
		/// <returns></returns>
		public int handleDBInt(object input, int defaultValue)
		{
			//if the input isn't null and it isn't a database null
			if (input != null && input != DBNull.Value)
			{
				//attempt to cast to correct datatype
				try
				{
					return int.Parse(input.ToString());
				}
				catch(Exception)
				{}
			}
			return defaultValue;
		}



		/// <summary>
		///	returns a float, if there is a problem a invalid cast exception is thrown
		/// </summary>
		/// <param name="input"></param>
		/// <returns></returns>
		public float handleDBFloat(object input)
		{
			//attempt to cast to correct datatype
			return float.Parse(input.ToString());
		}

		/// <summary>
		///	returns a float, if there is the defalut value is returned
		/// </summary>
		/// <param name="input"></param>
		/// <returns></returns>
		public float handleDBFloat(object input, float defaultValue)
		{
			//if the input isn't null and it isn't a database null
			if (input != null && input != DBNull.Value)
			{
				//attempt to cast to correct datatype
				try
				{
					return float.Parse(input.ToString());
				}
				catch (Exception)
				{}
			}
			return defaultValue;
		}


















		/// <summary>
		///	returns a double, if there is a problem a invalid cast exception is thrown
		/// </summary>
		/// <param name="input"></param>
		/// <returns></returns>
		public double handleDBDouble(object input)
		{
			//attempt to cast to correct datatype
			return double.Parse(input.ToString());
		}

		/// <summary>
		///	returns a double, if there is the defalut value is returned
		/// </summary>
		/// <param name="input"></param>
		/// <returns></returns>
		public double handleDBDouble(object input, double defaultValue)
		{
			//if the input isn't null and it isn't a database null
			if (input != null && input != DBNull.Value)
			{
				//attempt to cast to correct datatype
				try
				{
					return double.Parse(input.ToString());
				}
				catch (Exception)
				{}
			}
			return defaultValue;
		}
		/// <summary>
		/// returns boolean type, if there is a problem a invalid cast exception is thrown
		/// </summary>
		/// <param name="input"></param>
		/// <returns></returns>
		public bool handleDBBool(object input) 
		{
			if (input.ToString() == "1")
				return true;
			if (input.ToString() == "0")
				return false;
			return bool.Parse(input.ToString());
		}

		/// <summary>
		/// returns boolean type, if there is a problem the defalut value is returned
		/// </summary>
		/// <param name="input"></param>
		/// <returns></returns>
		public bool handleDBBool(object input, bool defaultValue) 
		{
			//if the input isn't null and it isn't a database null
			if (input != null && input != DBNull.Value)
			{
				//attempt to cast to correct datatype
				try
				{
					if (input.ToString() == "1")
						return true;
					if (input.ToString() == "0")
						return false;
					return bool.Parse(input.ToString());
				}
				catch(Exception)
				{}
			}
			return defaultValue;
		}

		/// <summary>
		/// returns the date time, if there is a problem a invalid cast exception is thrown
		/// </summary>
		/// <param name="input"></param>
		/// <returns></returns>
		public DateTime handleDBDateTime(object input)
		{
			try
			{
				return DateTime.Parse(input.ToString());
			}
			catch(Exception ex)
			{
				throw new InvalidCastException("Unable to convert to DateTime",ex) ;
			}				
		}

		/// <summary>
		/// returns the date time, if there is a problem a invalid cast exception is thrown
		/// </summary>
		/// <param name="input"></param>
		/// <returns></returns>
		public DateTime handleDBDateTime(object input, DateTime defaultValue)
		{
			//if the input isn't null and it isn't a database null
			if (input != null && input != DBNull.Value)
			{
				//attempt to cast to correct datatype
				try
				{
					return DateTime.Parse(input.ToString());
				}
				catch(Exception)
				{}
			}
			return defaultValue;
		}

		/// <summary>
		/// returns the string ' if there are problems an invalid cast exception is thrown
		/// </summary>
		/// <param name="input"></param>
		/// <returns></returns>
		public string handleDBString(object input)
		{
			try
			{
				return input.ToString();
			}
			catch(Exception ex)
			{
				throw new InvalidCastException("Unable to convert to string",ex) ;
			}				

		}
		/// <summary>
		/// returns the string - if not possible it returns the default value
		/// </summary>
		/// <param name="input"></param>
		/// <param name="defaultValue"></param>
		/// <returns></returns>
		public string handleDBString(object input, string defaultValue)
		{
			try
			{
				return input.ToString();
			}
			catch(Exception)
			{}		
			return defaultValue ;
		}
		#endregion
	}
}
















