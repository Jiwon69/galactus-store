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
		Integer idSubcategoria = Integer.parseInt(request.getParameter("idSubcategoria"));
		List<Producto> productos = productoService.listarProductosPorIdSubcategoria(idSubcategoria);
		request.setAttribute("productos", productos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/productos.jsp");
		dispatcher.forward(request,response);
	}


}
