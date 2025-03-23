package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Producto;
import models.Subcategoria;
import services.CategoriaService;
import services.ProductoService;
import services.impl.CategoriaServiceImpl;
import services.impl.ProductoServiceImpl;

@WebServlet("/productos")
public class ProductoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final ProductoService productoService;
       
    public ProductoServlet() {
        super();
        productoService = new ProductoServiceImpl();
    }

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

                    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/detalleproducto.jsp");
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
