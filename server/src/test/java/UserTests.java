import com.fasterxml.jackson.databind.ObjectMapper;
import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import org.junit.jupiter.api.*;

import java.sql.SQLException;
import java.util.Map;

import static org.assertj.core.api.Java6Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UserTests {
    static final ObjectMapper mapper = new ObjectMapper();
    private static final int TEST_SERVER_PORT = 8081;
    private static final String BASE_URL = "http://localhost:" + TEST_SERVER_PORT;
    private static AffirmationHelper server;

    @BeforeAll
    public static void startServer() throws SQLException {
        server = new AffirmationHelper("affirmation_helper.db");
        server.start(TEST_SERVER_PORT);
    }

    @AfterAll
    public static void stopServer() {
        server.stop();
    }

    @Test
    @Order(1)
    @DisplayName("Server status: POST /user/newUser adding user")
    void testAddNewUser() {
        Map<String, String> userMap =
                Map.of("userID", "test-userid-new",
                        "username", "test-2", "password", "testHello");


        HttpResponse<JsonNode> resp = Unirest.post(BASE_URL + "/user/newUser")
                .header("content-type", "application/json")
                .body(userMap)
                .asJson();
        assertThat(resp.getStatus()).isEqualTo(200);
    }

    @Test
    @Order(2)
    @DisplayName("Server status: POST /user/newUser check if existing")
    void testAddUserExists() {
        Map<String, String> userMap =
                Map.of("userID", "test-userid-new",
                        "username", "test-2", "password", "testHello");


        HttpResponse<JsonNode> resp = Unirest.post(BASE_URL + "/user/newUser")
                .header("content-type", "application/json")
                .body(userMap)
                .asJson();
        assertThat(resp.getStatus()).isEqualTo(409);
    }

    @Test
    @Order(3)
    @DisplayName("Server status: POST /login")
    void testLoginWithUser() {
        Map<String, String> userMap =
                Map.of("userID", "test-userid-new",
                        "username", "test-2", "password", "testHello");


        HttpResponse<JsonNode> resp = Unirest.post(BASE_URL + "/login")
                .header("content-type", "application/json")
                .body(userMap)
                .asJson();
        assertThat(resp.getStatus()).isEqualTo(200);
        assertEquals("test-2", resp.getBody().getObject().get("username"));
        assertEquals("testHello", resp.getBody().getObject().get("password"));
        assertEquals("test-userid-new", resp.getBody().getObject().get("userID"));
    }

    @Test
    @Order(4)
    @DisplayName("Server status: DELETE /user/deleteUser")
    void testDeleteNewUser() {
        Map<String, String> userMap =
                Map.of("username", "test-2", "password", "testHello");


        HttpResponse<JsonNode> resp = Unirest.delete(BASE_URL + "/user/deleteUser")
                .header("content-type", "application/json")
                .body(userMap)
                .asJson();
        assertThat(resp.getStatus()).isEqualTo(200);
    }
}
