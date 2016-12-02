import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<InventoryEntry> inventory = new ArrayList<>();
		
		Connection c = null;
        try
        {
            String url = "jdbc:mysql://cs3.calstatela.edu/cs3220stu";
            String username = 
            String password = 

            c = DriverManager.getConnection( url, username, password );
            Statement stmt = c.createStatement();
           
            ResultSet rs = stmt.executeQuery( "select * from inventory where quantity>0" );
            
            while( rs.next() )
            {
                InventoryEntry entry = new InventoryEntry( rs.getString( "name" ), rs.getInt("quantity"), rs.getDouble("price"),rs.getInt("id"));
                	inventory.add( entry );
            }
        }
        catch( SQLException e )
        {
            throw new ServletException( e );
        }
        finally
        {
            try
            {
                if( c != null ) c.close();
            }
            catch( SQLException e )
            {
                throw new ServletException( e );
            }
		}
        request.getSession().setAttribute("inventory", inventory);
		request.getRequestDispatcher( "/WEB-INF/Checkout.jsp" ).forward(request, response );
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		
		request.getSession().setAttribute("firstNameError", null);
		request.getSession().setAttribute("lastNameError", null);
		request.getSession().setAttribute("emailError", null);
		request.getSession().setAttribute("infoError", null);
		
		boolean ok = true;
		
		if(firstName.trim().length()==0){
			request.getSession().setAttribute("firstNameError", true);
			request.setAttribute("firstName", null);
			ok = false;
		}else{
			request.setAttribute("firstName", firstName);
		}
		
		if(lastName.trim().length()==0){
			request.getSession().setAttribute("lastNameError", true);
			request.setAttribute("lastName", null);
			ok = false;
		}else{
			request.setAttribute("lastName", lastName);
		}
		
		if(email.trim().length()==0||!email.contains("@")){
			request.getSession().setAttribute("emailError", true);
			request.setAttribute("email", null);
			ok = false;
		}else{
			request.setAttribute("email", email);
		}
		
		if(ok){
			List<ShoppingCartModel> shoppingCart = (List<ShoppingCartModel>) request.getSession().getAttribute("shoppingCart");
			List<InventoryEntry> inventory = (List<InventoryEntry>) request.getSession().getAttribute("inventory");
			Random rand = new Random();
			int orderNumber = rand.nextInt(499)+1000+rand.nextInt(499)*(rand.nextInt(8)+1);
			
			Connection c = null;
	        try
	        {
	            String url = "jdbc:mysql://cs3.calstatela.edu/cs3220stu";
	            String username = 
	            String password = 
	            
	            String sql = "update inventory set quantity=? where id=?";
	            c = DriverManager.getConnection( url, username, password );
		            
		        for(ShoppingCartModel item : shoppingCart){
		            int id = item.id;
		            int quantity = 0;
		            
		            for(InventoryEntry entry : inventory){
		            	if(entry.id==id){
		            		quantity = entry.quantity - item.quantity;
		            	}
		            }
		            PreparedStatement pstmt = c.prepareStatement( sql );
		            pstmt.setInt( 1,quantity);
		            pstmt.setInt( 2,id);
		            pstmt.executeUpdate();
		            
		            Statement stmt = c.createStatement();
		            ResultSet rs = stmt.executeQuery( "select * from purchases");
		            
		            boolean numValid = false;
		            while(numValid = false){
		            	int count=0;
			            while( rs.next())
			            {
			            	int order_number=rs.getInt("order_number");
			                if(order_number == orderNumber){
			                	count++;
			            	}
			            }
			            orderNumber+=rand.nextInt(16);
			            if(count==0){
			            	numValid=true;
			            }
		            }
		            
		            String sql2 = "insert purchases (name, quantity, total, order_number) values (?,?,?,?)";
		            pstmt = c.prepareStatement( sql2 );
		            
		            pstmt.setString( 1, item.name );
		            pstmt.setInt(2, item.quantity);
		            pstmt.setDouble(3, Double.parseDouble(String.format("%.2f", item.total)));
		            pstmt.setInt(4, orderNumber);
		            pstmt.executeUpdate();
	            }
	        }
	        catch( SQLException e )
	        {
	            throw new ServletException( e );
	        }
	        finally
	        {
	            try
	            {
	                if( c != null ) c.close();
	            }
	            catch( SQLException e )
	            {
	                throw new ServletException( e );
	            }
	        }
	        request.getSession().setAttribute("orderNumber", orderNumber);
	        request.getSession().setAttribute("cart", null);
	        request.getSession().setAttribute("shoppingCart", null);
	        request.getSession().setAttribute("cartAmount", null);
	        response.sendRedirect("Receipt");
		}else{
			request.getSession().setAttribute("infoError", true);
			doGet(request,response);
		}
	}

}
