using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CustomerTransaction
/// </summary>
public class CustomerTransaction : Tools.DBbase
{
	public CustomerTransaction(): base(ConfigurationManager.ConnectionStrings["DinnerDetectiveConnectionString"].ConnectionString){	}


    
    public long SaveCustomerInfo(string firstName, string lastName, string address, string city, string state, string zip, string phoneNumber, string fax, string email)
    {
        SqlParameter[] param = { new SqlParameter("@FirstName", firstName),
								 new SqlParameter("@LastName", lastName),
							     new SqlParameter("@Address", address),
                                 new SqlParameter("@City", city),
                                 new SqlParameter("@State", state),
                                 new SqlParameter("@Zip", zip),
                                 new SqlParameter("@PhoneNumber", phoneNumber),
                                 new SqlParameter("@Fax", fax),
                                 new SqlParameter("@Email", email)};
        try
        {
            return executeStoredProcedure("CustomerInsert", param, SqlDbType.BigInt);
        }
        catch (Exception ex)
        {
            return -1;
        }
    }

    public long SaveShippingInfo(string firstName, string lastName, string address, string city, string state, string zip)
    {
        SqlParameter[] param = { new SqlParameter("@FirstName", firstName),
								 new SqlParameter("@LastName", lastName),
							     new SqlParameter("@Address", address),
                                 new SqlParameter("@City", city),
                                 new SqlParameter("@State", state),
                                 new SqlParameter("@Zip", zip)};
        try
        {
            return executeStoredProcedure("ShippingInsert", param, SqlDbType.BigInt);
        }
        catch (Exception ex)
        {
            return -1;
        }
    }

    public long SaveTransaction(long customerID, long showID, long mealID, long dessertID, long drinkID, int tickets, string price, string total, long shippingID)
    {
        SqlParameter[] param = { new SqlParameter("@CustomerID", customerID),
								 new SqlParameter("@ShowID", showID),
							     new SqlParameter("@MealID", mealID),
                                 new SqlParameter("@DessertID", dessertID),
                                 new SqlParameter("@DrinkID", drinkID),
                                 new SqlParameter("@Tickets", tickets),
                                 new SqlParameter("@Price", price),
                                 new SqlParameter("@ShippingID", shippingID)};
        try
        {
            return executeStoredProcedure("TransactionInsert", param, SqlDbType.BigInt);
        }
        catch (Exception ex)
        {
            return -1;
        }
    }
}
