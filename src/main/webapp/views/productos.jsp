<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Producto" %>
<%@ page import= "shared.Constants" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>GALACTUS STORE | SISE</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://cdn.tailwindcss.com"></script>
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
					<a href="productos?id=<%= producto.getIdProducto() %>" 
				   class="flex flex-col bg-gray-200 w-[200px] justify-center p-4 gap-2 items-center 
				          rounded-md border border-gray-300 border-solid 
				          hover:border-green-600 hover:shadow-lg shadow-md cursor-pointer transition-all">
				    
				    <img class="rounded-sm w-24 h-24 object-cover" 
				         src="<%= producto.getImagenUrl() != null ? producto.getImagenUrl() : Constants.IMAGEN_PRODUCTO_DEFAULT %>" 
				         alt="Imagen del producto <%= producto.getNombre() %>">
				    
				    <div class="flex flex-col justify-start gap-1 text-center">
				        <span class="text-xs text-green-600 font-medium">
				            <%= producto.getCodigoInterno() %>
				        </span>
				        <span class="font-bold text-gray-600 text-sm">
				            <%= producto.getNombre() %>
						    </span>
						  <span class="font-bold text-blue-600 text-xl">
		            S/. <%= producto.getPrecio() %>
		        </span>
		    </div>
		</a>
		
				<% } %>
			<% } else { %>
				<p class="text-center text-gray-500">No se encontraron registros</p>
			<% } %>
		</div>
		
		<% if (productos != null && !productos.isEmpty()) { %>
			<div class="w-full p-4 text-center">Total registros: <%= productos.size() %></div>
		<% } %>
	</main>
</body>
</html>