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
import org.apache.http.client.methods.HttpPut;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import eseo.twic.beans.VilleFrance;
import eseo.twic.utilitaire.RestResponse;

/**
 * Servlet implementation class VillesServlet
 */
@WebServlet("/VillesServlet")
public class VillesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String URL_GET = "http://localhost:8181/get";
	private String URL_PUT = "http://localhost:8181/put?";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VillesServlet() {
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
		this.getServletContext().getRequestDispatcher("/villes.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String codeCommuneINSEE = request.getParameter("codeCommuneINSEE");
		String nomCommune = request.getParameter("nomCommune");
		String codePostal = request.getParameter("codePostal");
		String libelleAcheminement = request.getParameter("libelleAcheminement");
		String ligne5 = request.getParameter("ligne5");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		
		HttpClient client = HttpClientBuilder.create().build();
		HttpPut httpPut = new HttpPut(URL_PUT+"codeCommuneINSEE="+codeCommuneINSEE+"&nomCommune="+nomCommune+"&codePostal="+codePostal+
											"&libelleAcheminement="+libelleAcheminement+"&ligne5="+ligne5+
											"&latitude="+latitude+"&longitude="+longitude);
		
		client.execute(httpPut);
		
		doGet(request,response);
	}

}
