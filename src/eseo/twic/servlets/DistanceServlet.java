package eseo.twic.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import eseo.twic.beans.VilleFrance;
import eseo.twic.utilitaire.RestResponse;

/**
 * Servlet implementation class DistanceServlet
 */
@WebServlet("/DistanceServlet")
public class DistanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String URL_GET = "http://localhost:8181/get";
	private String URL_GET_VILLE = "http://localhost:8181/get?codeCommuneINSEE=";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DistanceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<VilleFrance> villes = new ArrayList<VilleFrance>();
		villes = RestResponse.getRestResponse(URL_GET);
		HttpClient client = HttpClientBuilder.create().build();
        HttpGet req = new HttpGet(URL_GET);

        try {
            HttpResponse res = client.execute(req);
            HttpEntity entity = res.getEntity();

            // Read the contents of an entity and return it as a String.
            String content = EntityUtils.toString(entity);
            //System.out.println(content);
        } catch (IOException e) {
            e.printStackTrace();
        }
		request.setAttribute("villes", villes);
		this.getServletContext().getRequestDispatcher("/distance.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String code1 = request.getParameter("ville1");
		String code2 = request.getParameter("ville2");

		VilleFrance ville1 = new VilleFrance();
		ville1 = RestResponse.getRestResponse(URL_GET_VILLE+code1).get(0);
		double long1 = Math.toRadians(Double.parseDouble(ville1.getLongitude()));
		double lat1 = Math.toRadians(Double.parseDouble(ville1.getLatitude()));
		
		VilleFrance ville2 = new VilleFrance();
		ville2 = RestResponse.getRestResponse(URL_GET_VILLE+code2).get(0);
		double long2 = Math.toRadians(Double.parseDouble(ville2.getLongitude()));
		double lat2 = Math.toRadians(Double.parseDouble(ville2.getLatitude()));
		//ACOS(SIN(lat1)*SIN(lat2)+COS(lat1)*COS(lat2)*COS(lon2-lon1))*6371
		double distance = Math.acos((Math.sin(lat1)*Math.sin(lat2))+(Math.cos(lat1)*Math.cos(lat2)*Math.cos(long2-long1)))*6378;
		distance = (Math.round(distance*100))/100;
		request.setAttribute("distance", distance);
		request.setAttribute("ville1", ville1);
		request.setAttribute("ville2", ville2);
		
		doGet(request,response);
		
	}

}
