package services.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import dao.ProductoMapper;
import models.Producto;
import services.ProductoService;

public class ProductoServiceImpl implements ProductoService {

    @Override
    public List<Producto> listarProductosPorIdSubcategoria(Integer idSubcategoria) {
        try {
            SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
            ProductoMapper productoMapper = session.getMapper(ProductoMapper.class);
            return productoMapper.listarProductosPorIdSubcategoria(idSubcategoria);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public Producto obtenerProductoPorId(int id) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            ProductoMapper productoMapper = session.getMapper(ProductoMapper.class);
            return productoMapper.buscarPorId(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
