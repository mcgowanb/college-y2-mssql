using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace proc_test
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        S00165159TSQLProjectEntities1 db;
        public MainWindow()
        {
            InitializeComponent();
            db = new S00165159TSQLProjectEntities1();
        }

        private void btnAddBet_Click(object sender, RoutedEventArgs e)
        {
            int customerID = Convert.ToInt32(txtCustomerID.Text);
            int walletID = Convert.ToInt32(txtWalletID.Text);
            int actionID = Convert.ToInt32(txtActionID.Text);
            decimal amount = Convert.ToDecimal(txtAmount.Text);

            try
            {
                //SqlCommand cmd = new SqlCommand("Assign1");
                //cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //cmd.Parameters.Add(new SqlParameter("@ActionID", actionID));
                //cmd.Parameters.Add(new SqlParameter("@CustomerID", customerID));
                //cmd.Parameters.Add(new SqlParameter("@betAmount", amount));
                //cmd.Parameters.Add(new SqlParameter("@walltID", walletID));

                //cmd.ExecuteNonQuery();
                //db.AssignTest(actionID, customerID, amount, walletID);
                db.Assign1(actionID, customerID, amount, walletID);
               
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.InnerException.Message);
            }




        }
    }
}
public static class ExceptionExtensions
{
    public static Exception GetOriginalException(this Exception ex)
    {
        if (ex.InnerException == null) return ex;

        return ex.InnerException.GetOriginalException();
    }
}