package test;

import br.com.chiquitto.aula.jdbcblog.dao.CategoriaDao;
import br.com.chiquitto.aula.jdbcblog.vo.Categoria;
import util.Util;

public class CategoriaCadastrarTest {
    
    public static void main(String[] args) {
        Util.iniciarConexao();
        
        Categoria categoria = new Categoria();
        categoria.setCategoria("Desenhos");
        
        CategoriaDao dao = new CategoriaDao();
        dao.cadastrar(categoria);
    }
    
}
