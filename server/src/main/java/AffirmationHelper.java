import http.APIHandler;
import io.javalin.Javalin;
import io.javalin.http.Context;

public class AffirmationHelper {
    private final Javalin server;
    private final int DEFAULT_PORT = 8080;

    public AffirmationHelper(String dbUrl) {
        server = Javalin.create();
        //Cute, left here because.
        server.get("/_ping", context -> context.result("pong"));

        APIHandler apiHandler = new APIHandler(dbUrl);
        server.post("/login", context -> apiHandler.getUserData(context));
        server.post("/user/newUser", context -> apiHandler.addUserData(context));
        server.delete("/user/deleteUser", context -> apiHandler.deleteUser(context));
        server.get("/moods/{user}", context -> apiHandler.getAllMoodsData(context));
        server.post("/mood/{user}", context -> apiHandler.addMood(context));
    }

    public void start(int port) {
        int listen_port = port > 0 ? port : DEFAULT_PORT; // use port if > 0 otherwise use DEFAULT_PORT value
        this.server.start(listen_port);
    }

    public void stop() {
        this.server.stop();
    }

    public static void main(String[] args) {
        AffirmationHelper server = new AffirmationHelper(args[0]);
        server.start(8080);
    }
}
