import java.math.BigDecimal;
import java.math.RoundingMode;
import java.security.Provider;
import java.sql.*;
import java.util.Scanner;

public class GeneratingBill {

    public static void main(String[] args) {
        String JDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String connectDB = "jdbc:sqlserver://127.0.0.1\\SQLEXPRESS:1433;trustServerCertificate=true;database=UTILITY SERVICE PROVIDER";

        try {
            Class.forName(JDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.exit(0);
        }

        try {
            String user = "sa";
            String password = "Te5HqyV3";
            Connection con = DriverManager.getConnection(connectDB,user,password); // Connect to SQL Server
            Statement cmd = con.createStatement(); // Create SQL command object

            ResultSet rs;
            ResultSet RateRS;
            ResultSet TaxRS;
            double totalConsumption;
            double ServiceRate;


            int RateID;
            int OverdueID;
            int MeterReadingID;
            int TaxRateID;
            int AccountID;
            String StatementDate;
            String DueDate;

            Scanner myObj = new Scanner(System.in);
            System.out.println("This program will help you to generate a bill");
            System.out.println("Firstly, we will calculate the total amount due in a bill");
            System.out.println("The formula is TotalAmountDue = ((EndMeterReading-StartMeterReading) * TaxRate*ServiceRate) + OverdueAmount\n");

            //choosing a ServiceRate
            System.out.println("Please choose a RateID from the following ServiceRate table\n");
            String sql = "select * from ServicesRate ";
            rs = cmd.executeQuery(sql);
            System.out.println("RateID" + "\t" + "ProviderID" + "\t" +"ServiceType" + "\t" +"ServiceRate");
            while (rs.next()) {
                System.out.println(rs.getInt("RateID") + "\t" + rs.getInt("ProviderID") + "\t" + rs.getString("ServiceType") + "\t" + rs.getDouble("ServiceRate"));
            }

            System.out.println("\nEnter a RateID");
            RateID = myObj.nextInt();
            String getRate = "select ServiceRate from ServicesRate where RateID="+RateID+";";
            RateRS = cmd.executeQuery(getRate);
            RateRS.next();
            ServiceRate = RateRS.getDouble("ServiceRate");
            System.out.println("The ServiceRate you chose is "+ServiceRate+"($ per unit)");

            //entering meter reading
            System.out.println("\nPlease enter start meter reading (meter value at first day of a month) and end meter reading (meter value at last day of a month)");
            System.out.println("enter start meter reading");
            double start = myObj.nextDouble();
            System.out.println("enter end meter reading");
            double end = myObj.nextDouble();
            totalConsumption = end-start;
            System.out.println("TotalConsumptionUnit = EndMeterReading - StartMeterReading ="+totalConsumption);

            String getMeter = "select MeterReadingID from MeterReading where StartMeterReading="+start+"and EndMeterReading="+end+";";
            ResultSet Meter = cmd.executeQuery(getMeter);

            if(Meter.next())
            {
                MeterReadingID = Meter.getInt("MeterReadingID");
                //System.out.println("MeterReadingID :"+MeterReadingID+"\n");
            }
            else
            {


                String insertMeter = "insert into MeterReading (StartMeterReading,EndMeterReading) values ("+start+","+end+");";
                cmd.executeUpdate(insertMeter);
                String getMeter1 = "select MeterReadingID from MeterReading where StartMeterReading="+start+"and EndMeterReading="+end+";";
                ResultSet Meter1 = cmd.executeQuery(getMeter1);
                Meter1.next();
                MeterReadingID = Meter1.getInt("MeterReadingID");

                //System.out.println("MeterReadingID :"+MeterReadingID);
            }





            double consumptionCharge = ServiceRate*totalConsumption;
            BigDecimal bd1 = new BigDecimal(consumptionCharge).setScale(2, RoundingMode.HALF_UP);
            consumptionCharge = bd1.doubleValue();
            System.out.println("Consumption Charge = TotalConsumptionUnit * ServiceRate = "+consumptionCharge+"\n");

            //choosing tax rate
            System.out.println("please choose a TaxRateID from the table below");
            TaxRS = cmd.executeQuery("SELECT TaxRateID, Province, TaxRate FROM TaxRate");
            System.out.println("TaxRateID" + "\t" + "Province" + "\t" +"TaxRate");
            while (TaxRS.next()) {
                System.out.println(TaxRS.getInt("TaxRateID") + "\t" + TaxRS.getString("Province") + "\t" + TaxRS.getDouble("TaxRate"));
            }

            TaxRateID = myObj.nextInt();
            String getTax = "select TaxRate from TaxRate where TaxRateID="+TaxRateID+";";
            ResultSet TaxRate = cmd.executeQuery(getTax);
            TaxRate.next();
            double taxrate = TaxRate.getDouble("TaxRate");
            System.out.println("the tax rate you choose is "+taxrate);
            double AmountWithTax = (taxrate+1)*consumptionCharge;
            BigDecimal bd2 = new BigDecimal(AmountWithTax).setScale(2, RoundingMode.HALF_UP);
            AmountWithTax = bd2.doubleValue();
            System.out.println("(TaxRate+1) * Consumption Charge = "+AmountWithTax);

            //choosing amount overdue
            System.out.println("Please enter the overdue amount");
            double overdue = myObj.nextDouble();
            String getOverdue = "select OverdueID from Overdue where OverdueAmount="+overdue;
            ResultSet Overdue = cmd.executeQuery(getOverdue);

            if(Overdue.next())
            {
                OverdueID = Overdue.getInt("OverdueID");
                //System.out.println("OverdueID :"+OverdueID);
            }
            else
            {
                String insertOverdue = "insert into Overdue (OverdueAmount) values ("+overdue+");";
                cmd.executeUpdate(insertOverdue);
                String getOverdue1 = "select OverdueID from Overdue where OverdueAmount="+overdue+";";
                ResultSet Overdue1 = cmd.executeQuery(getOverdue1);
                Overdue1.next();
                OverdueID = Overdue1.getInt("OverdueID");

                //System.out.println("OverdueID :"+OverdueID);
            }
            double totalAmountDue = AmountWithTax+overdue;
            System.out.println("TotalAmountDue \n= (EndMeterReading-StartMeterReading)*(TaxRate+1)*ServiceRate + OverdueAmount\n= "+totalAmountDue+"\n");
            //insert a new tuple to TotalAmountDue
            String insertTAD = "insert into TotalAmountDue values ("+RateID+","+TaxRateID+","+MeterReadingID+","+OverdueID+","+totalAmountDue+");";
            cmd.executeUpdate(insertTAD);
            //TotalAmountDue is calculated, now creating the complete bill
            //System.out.println("Now we are going to generate a bill");
            System.out.println("We already have the TotalAmountDue, but a bill has more information than the total amount due");
            System.out.println("such as provider, customer, statement date, and due date.\n");
            System.out.println("The following tables tells the information about Customer and Provider\n");
            //System.out.println("CustomerID" + "\t" + "AddressID" + "\t" +"CustomerContactID" + "\t"+"CustomerFirstname" + "\t"+"CustomerMidname" + "\t"+"CustomerLastname" + "\t"+"CustomerEmail");
            System.out.println("Customer table:");
            String selectCustomer = "select * from Customer";
            ResultSet customer = cmd.executeQuery(selectCustomer);
            ResultSetMetaData rsmd = customer.getMetaData();
            int columnCount = rsmd.getColumnCount();
            int[] columnWidths = new int[columnCount];
            for (int i = 1; i <= columnCount; i++) {
                String columnName = rsmd.getColumnName(i);
                columnWidths[i-1] = Math.max(columnName.length(), 10);
                System.out.printf("%-" + columnWidths[i-1] + "s ", columnName);
            }
            System.out.println();
            while (customer.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    String columnValue = customer.getString(i);
                    System.out.printf("%-" + columnWidths[i-1] + "s ", columnValue);
                }
                System.out.println();
            }

            //print provider table
            System.out.println("\nProvider table:");
            String selectProvider = "select * from Provider";
            ResultSet provider = cmd.executeQuery(selectProvider);
            ResultSetMetaData rsmd1 = provider.getMetaData();
            int columnCount1 = rsmd1.getColumnCount();
            int[] columnWidths1 = new int[columnCount];
            for (int i = 1; i <= columnCount1; i++) {
                String columnName1 = rsmd1.getColumnName(i);
                columnWidths1[i-1] = Math.max(columnName1.length(), 10);
                System.out.printf("%-" + columnWidths1[i-1] + "s ", columnName1);
            }
            System.out.println();
            while (provider.next()) {
                for (int i = 1; i <= columnCount1; i++) {
                    String columnValue1 = provider.getString(i);
                    System.out.printf("%-" + columnWidths1[i-1] + "s ", columnValue1);
                }
                System.out.println();
            }



            System.out.println("\nA customer will open an account for a provider");
            System.out.println("One customer and one provider will only have one account, so the AccountID can tell you a specific provider and a specific customer");
            System.out.println("Remember the CustomerID and ProviderID from above tables,and choose an AccountID from the following CustomerAccount table. \n");

            //print customer account table
            System.out.println("CustomerAccount table:");
            String selectCustomerAccount = "select * from CustomerAccount";
            ResultSet customerAccount = cmd.executeQuery(selectCustomerAccount);
            ResultSetMetaData rsmd2 = customerAccount.getMetaData();
            int columnCount2 = rsmd2.getColumnCount();
            int[] columnWidths2 = new int[columnCount2];
            for (int i = 1; i <= columnCount2; i++) {
                String columnName2 = rsmd2.getColumnName(i);
                columnWidths2[i-1] = Math.max(columnName2.length(), 10);
                System.out.printf("%-" + columnWidths2[i-1] + "s ", columnName2);
            }
            System.out.println();
            while (customerAccount.next()) {
                for (int i = 1; i <= columnCount2; i++) {
                    String columnValue2 = customerAccount.getString(i);
                    System.out.printf("%-" + columnWidths2[i-1] + "s ", columnValue2);
                }
                System.out.println();
            }
            System.out.println("\nEnter an AccountID");
            AccountID = myObj.nextInt();

            System.out.println("\nEnter a statement date of the bill");
            StatementDate = myObj.next();

            System.out.println("\nEnter a due date of the bill");
            DueDate = myObj.next();

            String insertBill = "insert into CustomerBill (AccountID,RateID,TaxRateID,MeterReadingID,OverdueID,StatementDate,DueDate) values ("+AccountID+","+RateID+","+TaxRateID+","+MeterReadingID+","+OverdueID+","+"'"+StatementDate+"'"+","+"'"+DueDate+"');";
            cmd.executeUpdate(insertBill);


            //print view table
            System.out.println("\nThe following table is a view contains all the informations of a bill in real life");
            String selectView = "select * from CUSTOMER_BILL_PROFILE";
            ResultSet view = cmd.executeQuery(selectView);
            ResultSetMetaData rsmd3 = view.getMetaData();
            int columnCount3 = rsmd3.getColumnCount();
            int[] columnWidths3 = new int[columnCount3];
            for (int i = 1; i <= columnCount3; i++) {
                String columnName3 = rsmd3.getColumnName(i);
                columnWidths3[i-1] = Math.max(columnName3.length(), 10);
                System.out.printf("%-" + columnWidths3[i-1] + "s ", columnName3);
            }
            System.out.println();
            while (view.next()) {
                for (int i = 1; i <= columnCount3; i++) {
                    String columnValue3 = view.getString(i);
                    System.out.printf("%-" + columnWidths3[i-1] + "s ", columnValue3);
                }
                System.out.println();
            }




            cmd.close(); // Close command object connection
            con.close(); // Close database object connection
        } catch(SQLException e){
            e.printStackTrace();
            System.exit(0);
        }
    }
}
