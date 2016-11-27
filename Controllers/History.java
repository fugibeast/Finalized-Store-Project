import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/History")
public class History extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init( ServletConfig config ) throws ServletException
    {
        super.init( config );

        try
        {
            Class.forName( "com.mysql.jdbc.Driver" );
        }
        catch( ClassNotFoundException e )
        {
            throw new ServletException( e );
        }
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<HistoryModel> history = new ArrayList<>();
		
		Connection c = null;
        try
        {
            String url = "jdbc:mysql://cs3.calstatela.edu/cs3220stu";
            String username = "";
            String password = "";

            c = DriverManager.getConnection( url, username, password );
            Statement stmt = c.createStatement();
            
            ResultSet rs = stmt.executeQuery( "select * from purchases");
           
            while( rs.next() )
            {
            	HistoryModel entry = new HistoryModel( rs.getString( "name" ), rs.getInt("quantity"), rs.getDouble("total"), rs.getInt("order_number"));
                history.add( entry );
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
        request.getSession().setAttribute("history", history);
        request.getRequestDispatcher( "/WEB-INF/History.jsp" ).forward(request, response );
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

