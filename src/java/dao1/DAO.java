/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao1;

import model.DBConnect;
import entity.Account;
import entity.Bill;
import entity.Category;
import entity.Customer;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trinh
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBConnect dbconn = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Customer> getAllCustomer() {
        ArrayList<Customer> list = new ArrayList<Customer>();
        String sql = "select * from Customer";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Bill> getAllBill() {
        List<Bill> list = new ArrayList<>();
        String query = "select * from Bill";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getInt(7), rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Bill> getBillbystatus(String status) {
        List<Bill> list = new ArrayList<>();
        String query = "select*from Bill where status = ? order by dateCreate desc";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getInt(7), rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Bill> getBillbyName(String id) {
        List<Bill> list = new ArrayList<>();
        String query = "SELECT  *FROM Bill\n"
                + "where cid=?";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getInt(7), rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getTop3() {
        List<Product> list = new ArrayList<>();
        String query = "select top 3 * from product";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getNext3Product(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "  FROM product\n"
                + " ORDER BY id\n"
                + "OFFSET ? ROWS\n"
                + " FETCH NEXT 3 ROWS ONLY";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where cateID = ?";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductBySellID(int id) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where sell_ID = ?";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where [name] like ?";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String id) {
        String query = "select * from product\n"
                + "where id = ?";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Account> getAllUser() {
        List<Account> list = new ArrayList<>();
        String query = "select *from Account";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
            }
        } catch (Exception e) {

        }
        return list;

    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getExpensive() {
        String query = "select top 1 * from product\n"
                + "order by price desc";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Product getCheaper() {
        String query = "select top 1 * from product\n"
                + "order by price asc";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account login(String user, String pass) {
        String query = "select * from account\n"
                + "where [user] = ?\n"
                + "and pass = ?";

        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);

            rs = ps.executeQuery();

            while (rs.next()) {

                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Customer Login(String user, String pass) {
        String query = "select * from Customer\n"
                + "where [username] = ?\n"
                + "and password = ?";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);

            rs = ps.executeQuery();

            while (rs.next()) {

                return new Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5), rs.getString(6), 1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkAccountExist(String user) {
        String query = "select * from account\n"
                + "where [user] = ?\n";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void singup(String user, String pass) {
        String query = "insert into account\n"
                + "values(?,?,0,0)";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProduct(String pid) {
        String query = "delete from product\n"
                + "where id = ?";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProduct(String name, String image, String price,
            String title, String description, String category, int sid) {
        String query = "INSERT [dbo].[product] \n"
                + "([name], [image], [price], [title], [description], [cateID], [sell_ID])\n"
                + "VALUES(?,?,?,?,?,?,?)";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, "images/" + image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setInt(7, sid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void insertAccount(String name , String pass ,String isSell,String isAdmin){
        String query="insert Account([user],pass,isSell,isAdmin) values(?,?,?,?)";
     try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
          ps.setString(2, pass);
             ps.setString(3, isSell);
              ps.setString(4, isAdmin);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addCustomer(String name, String phone, String address, String username, String password) {
        String query = "insert into Customer(cname, cphone, cAddress, username, password)"
                + " values(?,?,?,?,?)";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setString(4, username);
            ps.setString(5, password);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addBill(String oid, String cname, String cphone, String cAddress, Double total, int cid) {
        String preSql = "insert into Bill(oID, cname, cphone, cAddress, total, cid)"
                + " values(?,?,?,?,?,?)";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(preSql);
            ps.setString(1, oid);
            ps.setString(2, cname);
            ps.setString(3, cphone);
            ps.setString(4, cAddress);
            ps.setDouble(5, total);
            ps.setInt(6, cid);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void addBillDetail(int id, String oid, int quantity, double price, double total) {
        String preSql = "insert into BillDetail(id, oID, quantity, price, total) "
                + "values (?,?,?,?,?)";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(preSql);
            ps.setInt(1, id);
            ps.setString(2, oid);
            ps.setInt(3, quantity);
            ps.setDouble(4, price);
            ps.setDouble(5, total);

            System.out.println(preSql);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void changePassword(String password, String username) {
        String sql = "update Account set pass=? where [user]=?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void UpdateBill(String oID) {
        String query = "update bill \n"
                + "set status=1\n"
                + "where oID=?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, oID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void UpdateBill2(String oID) {
        String query = "update bill \n"
                + "set status=2\n"
                + "where oID=?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, oID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void UpdateBill3(String oID) {
        String query = "update bill \n"
                + "set status=3\n"
                + "where oID=?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, oID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }


    public void editProduct(String name, String image, String price,
            String title, String description, String category, String pid) {
        String query = "update product\n"
                + "set [name] = ?,\n"
                + "[image] = ?,\n"
                + "price = ?,\n"
                + "title = ?,\n"
                + "[description] = ?,\n"
                + "cateID = ?\n"
                + "where id = ?";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(7, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "order by id\n"
                + "offset ? rows fetch next 6 rows only";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }

        } catch (Exception e) {

        }
        return list;
    }

    public int getTotalProduct() {
        String sql = "select count(*) from Product";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query = "select * from account";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ResultSet getData(String sql) {
        ResultSet rs = null;
        Statement state;

        try {
            conn = new DBConnect().getConnection();
            state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            rs = state.executeQuery(sql);
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Product> list = dao.getAllProduct();
        List<Category> listC = dao.getAllCategory();
        List<Account> listD = dao.getAllUser();
        List<Product> list1 = dao.pagingProduct(5);
        List<Customer> list3 = dao.getAllCustomer();
        List<Bill> list4 = dao.getBillbystatus("2");
        dao.insertAccount("123333", "1235422424", "1", "1");
//        for (Bill o : list4) {
//            System.out.println(o);
//        }
//        for(Customer o : list3){
//            System.out.println(o);
//        }
//        dao.addBill("2", "abc", "123123123", "TTKC", 250.000, 1);
//        dao.addBillDetail(2, "2", 5, 25.000, 125.000);
//        dao.UpdateBill("4");
//        List<Bill> list2= dao.getAllBill();
//        for(Bill o: list2){
//            System.out.println(o);
//       }
//        for(Product o : list1){
//            System.out.println(o);
//        }
//        int count =dao.getTotalProduct();
//        System.out.println(count);
//       Customer a= dao.Login("ducmanh", "dunghoinhe");
//        System.out.println(a);

//            dao.addCustomer("abc", "01236544", "ttkc", "123312312", "anhducmanh");
//        for(Account o: listD){
//            System.out.println(o);
//        }
//        for(Product o: list){
//            System.out.println(o);
//        }
//        for(Category a: listC){
//            System.out.println(a);
//        }
//        for (Category o : listC) {
//            System.out.println(o);
//        }
//        Account a = dao.login("Adam", "123456789");
//        System.out.println(a);
//         dao.changePassword("dunghoi456", "ducmanh");
    }

}
//demo git
