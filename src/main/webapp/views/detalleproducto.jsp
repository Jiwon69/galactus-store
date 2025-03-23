<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Producto" %>
<%@ page import="shared.Constants" %>
<%@ page import="services.ProductoService" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GALACTUS STORE | SISE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>

    <%
        List<Producto> productos = (List<Producto>) request.getAttribute("productos");
    %>

    <header>
        <div class="flex gap-4 bg-green-600 justify-center h-[50px] items-center">
            <a href="/galactus-store" class="h-auto text-white hover:bg-green-700 p-2 rounded-md cursor-pointer">Inicio</a>
            <a href="/galactus-store/categorias" class="h-auto text-white hover:bg-green-700 p-2 rounded-md cursor-pointer border border-white border-solid">Categorías</a>
            <a class="h-auto text-white hover:bg-green-700 p-2 rounded-md cursor-pointer">Marcas</a>
        </div>
    </header>

    <main class="p-4">
        <div class="flex w-full justify-center p-4 gap-4 flex-wrap">
            <% if (productos != null && !productos.isEmpty()) { %>
                <% for(Producto producto: productos) { %>
                    <a href="detalleproducto.jsp?id=<%= producto.getIdProducto() %>" class="flex w-full max-w-4xl bg-gray-200 justify-start items-start p-4 gap-4 rounded-md border border-gray-300 border-solid hover:border-green-600 cursor-pointer">
                        <!-- Imagen grande a la izquierda -->
                        <img class="w-1/2 h-auto rounded-lg" src="<%= producto.getImagenUrl() != null ? producto.getImagenUrl() : Constants.IMAGEN_PRODUCTO_DEFAULT %>" alt="<%= producto.getNombre() %>">

                        <!-- Detalles a la derecha de la imagen -->
                        <div class="flex flex-col w-1/2 justify-start gap-4">
                            <!-- Nombre del producto -->
                            <h2 class="text-2xl font-bold text-gray-800"><%= producto.getNombre() %></h2>
                            <!-- Código Interno -->
                            <span class="text-xs text-left text-green-600 font-medium"><%= producto.getCodigoInterno() %></span>
                            <!-- Modelo -->
                            <span class="text-center text-gray-600">Modelo: <%= producto.getModelo() %></span>
                            <!-- Stock -->
                            <span class="text-center text-gray-600">Stock: <%= producto.getStock() %></span>
                            <!-- Tiempo de Garantía -->
                            <span class="text-center text-gray-600">Garantía: <%= producto.getTiempoGarantia() %> años</span>
                            <!-- Precio -->
                            <span class="text-center font-bold text-blue-600 text-xl">S/. <%= producto.getPrecio() %></span>
                            <!-- Descripción -->
                            <p class="text-sm text-gray-600">Descripción: <%= producto.getDescripcion() %></p>
                        </div>
                    </a>
            <% 	} %>
			<%	} else { %>
				<p>No se encontraron registros</p>
			<% } %>
		</div>
			
		<% if (productos != null && !productos.isEmpty()) { %>
				<div class="w-full p-4">Total registros: <%= productos.size() %></div>
		<% } %>
		
	</main>
	
	
</body>
</html>