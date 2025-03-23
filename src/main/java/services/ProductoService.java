package services;

import java.util.List;
import models.Producto;

public interface ProductoService {
    List<Producto> listarProductosPorIdSubcategoria(Integer idSubcategoria);
    Producto obtenerProductoPorId(int id);  
}
