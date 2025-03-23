import services.ProductoService;
import services.impl.ProductoServiceImpl;
import models.Producto;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ProductoServlet extends HttpServlet {
    
    private ProductoService productoService; 
    @Override
    public void init() throws ServletException {
        super.init();
        productoService = new ProductoServiceImpl();  
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idSubcategoriaParam = request.getParameter("idSubcategoria");
        String idProductoParam = request.getParameter("id");

        try {
            if (idSubcategoriaParam != null) {
                Integer idSubcategoria = Integer.parseInt(idSubcategoriaParam);
                List<Producto> productos = productoService.listarProductosPorIdSubcategoria(idSubcategoria);
                request.setAttribute("productos", productos);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/productos.jsp");
                dispatcher.forward(request, response);
                return;
            }

            if (idProductoParam != null) {
                int idProducto = Integer.parseInt(idProductoParam);
                Producto producto = productoService.obtenerProductoPorId(idProducto);

                if (producto != null) {
                    request.setAttribute("producto", producto);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/detalle.jsp");
                    dispatcher.forward(request, response);
                    return;
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();  
        }

        response.sendRedirect("productos.jsp");  
    }
}
