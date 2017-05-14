package test;

import br.com.chiquitto.aula.jdbcblog.dao.CategoriaDao;
import br.com.chiquitto.aula.jdbcblog.vo.Categoria;
import java.util.List;
import util.Util;

/**
 *
 * @author faculdadealfa
 */
public class CategoriasListarTest {
    
    public static void main(String[] args) {
        
        Util.iniciarConexao();
        
        CategoriaDao dao = new CategoriaDao();
        
        List<Categoria> categorias = dao.getAll();
        
        for (Categoria categoria : categorias) {
            System.out.println(categoria.getIdcategoria());
            System.out.println(categoria.getCategoria());
        }
        
    }
    
}
