package dao;

import java.util.List;

import models.Producto;

public interface ProductoMapper {
	List<Producto> listarProductosPorIdSubcategoria(Integer idSubcategoria);
	Producto buscarPorId(int id);

}
