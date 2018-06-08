package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Connect.DBConnect;
import model.Category;
import model.Value;

public class ChartDAO {
	public ArrayList<Value> getAll() {
		try {
			CategoryDAO categoryDAO = new CategoryDAO();
			ProductDAO productDAO = new ProductDAO();
			ArrayList<Value> list = new ArrayList<>();
			for (Category category : categoryDAO.getListCategory()) {
				list.add(new Value(category.getCategoryName(),
						productDAO.getListProductByCategory(category.getCategoryID()).size()));
			}
			return list;
		} catch (SQLException ex) {
			Logger.getLogger(ChartDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}
	
	public double Total_bill () throws SQLException
	{
		Connection connection = DBConnect.getConnection();
        String sql = "SELECT SUM(total) FROM bill";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        double total = 0;
        while (rs.next()) {
            total = rs.getDouble(1);
        }
        System.out.println(total);
        
        return total;
        
        
		
	}

	public static void main(String[] args) throws SQLException  {
		// System.out.println(new ChartDAO().getAll());
//		for (Value v : new ChartDAO().getAll()) {
//			System.out.println(v.getName() + " - " + v.getValue());
//		}
		Connection connection = DBConnect.getConnection();
        String sql = "SELECT SUM(total) FROM bill";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        double total = 0;
        while (rs.next()) {
            total = rs.getDouble(1);
        }
        System.out.println(total);

	}
}
