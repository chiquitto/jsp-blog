package util;

import br.com.chiquitto.aula.jdbcblog.Conexao;

/**
 *
 * @author chiquitto
 */
public class Util {
    public static void iniciarConexao() {
        Conexao.setUrl("jdbc:sqlite:/Users/chiquitto/work/aula/jsp-blog/lib/blog.sqlite/blog.sqlite.db");
    }
}
