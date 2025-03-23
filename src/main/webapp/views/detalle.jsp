<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Producto" %>
<%@ page import="shared.Constants" %>
<% Producto producto = (Producto) request.getAttribute("producto"); %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Detalles del Producto</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex flex-col items-center min-h-screen p-4">

    <header class="bg-green-600 w-full p-3 text-white text-center">
        <h1 class="text-lg font-bold">Detalles del Producto</h1>
    </header>

    <main class="mt-4 w-full max-w-3xl">
        <% if (producto != null) { %>
            <div class="bg-white p-4 rounded-lg shadow-md flex">
                <!-- Imagen del Producto -->
                <div class="w-1/2 flex justify-center items-center">
                    <img class="rounded-lg shadow-md w-60 h-60 object-cover" src="<%= producto.getImagenUrl() != null ? producto.getImagenUrl() : Constants.IMAGEN_PRODUCTO_DEFAULT %>"
                        alt="Imagen del producto">
                </div>
                <!-- Tabla de detalles -->
                <div class="w-1/2 pl-4">
                    <table class="w-full border border-gray-300 rounded-lg overflow-hidden text-sm">
                        <tbody>
                            <tr>
                                <td class="p-1 border-b font-semibold">Nombre</td>
                                <td class="p-1 border-b text-gray-800"><%= producto.getNombre() %></td>
                            </tr>
                            <tr class="bg-gray-50">
                                <td class="p-1 border-b font-semibold">Código</td>
                                <td class="p-1 border-b text-gray-800"><%= producto.getCodigoInterno() %></td>
                            </tr>
                            <tr>
                                <td class="p-1 border-b font-semibold">Modelo</td>
                                <td class="p-1 border-b text-gray-800"><%= producto.getModelo() %></td>
                            </tr>
                            <tr class="bg-gray-50">
                                <td class="p-1 border-b font-semibold">Garantía</td>
                                <td class="p-1 border-b text-gray-800"><%= producto.getTiempoGarantiaMeses() %> meses</td>
                            </tr>
                            <tr>
                                <td class="p-1 border-b font-semibold">Stock</td>
                                <td class="p-1 border-b text-gray-800"><%= producto.getStock() %> unidades</td>
                            </tr>
                            <tr class="bg-gray-50">
                                <td class="p-1 border-b font-semibold">Precio</td>
                                <td class="p-1 border-b text-gray-800">S/. <%= producto.getPrecio() %></td>
                            </tr>
                            <tr>
                                <td class="p-1 border-b font-semibold">Descripción</td>
                                <td class="p-1 border-b text-gray-800"><%= producto.getDescripcion() %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        <% } else { %>
            <p class="text-red-500 font-bold text-lg text-center">Producto no encontrado.</p>
        <% } %>
    </main>

</body>

</html>
