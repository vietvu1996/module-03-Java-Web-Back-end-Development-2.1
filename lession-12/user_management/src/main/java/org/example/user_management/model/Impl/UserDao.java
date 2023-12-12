package org.example.user_management.model.Impl;


import org.example.user_management.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao implements IUserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private String jdbcUserName = "root";
    private String jdbcPassWord = "123456";
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USERS_BY_ID = "select id,name,email,country from users where id =?;";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";

    private static final String SELECT_ALL_USERS = "select * from users;";
    private static final String DELETE_USERS = "delete from users where id=?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_USER_BY_COUNTRY = "select * from users where country = ?";
    private static final String SELECT_ALL_USER_BY_NAME = "select * from users order by name";

    public UserDao() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassWord);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User getUserById(int id) {
        User user = null;
        String query = "{CALL get_user_by_id(?)}";

        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        String query = "{CALL insert_user(?,?,?)}";

        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public void addUserTransaction(User user, List<Integer> permissions) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        PreparedStatement assignment = null;

        ResultSet rs = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);

            preparedStatement = connection.prepareStatement(INSERT_USERS_SQL, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());

            int rowAffected = preparedStatement.executeUpdate();

            rs = preparedStatement.getGeneratedKeys();

            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt(1);
            }
            if (rowAffected == 1) {
                String sqlPivot = "INSERT INTO user_permission(user_id, permission_id)" + "VALUES(?, ?)";
                assignment = connection.prepareCall(sqlPivot);

                for (int permissionId : permissions) {
                    assignment.setInt(1, userId);
                    assignment.setInt(2, permissionId);
                    assignment.executeUpdate();
                }
                connection.commit();
            } else {
                connection.rollback();
            }
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
                if (assignment != null) assignment.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(id, name, email, country));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS)) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL)) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex
        ) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQL state: " + ((SQLException) e).getSQLState());
                System.err.println("Error code" + ((SQLException) e).getErrorCode());
                System.err.println("Message" + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public List<User> selectUserByCountry(String country) throws SQLException {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_USER_BY_COUNTRY)) {
            statement.setString(1, country);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public List<User> sortUserByName() throws SQLException {
        List<User> users = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER_BY_NAME);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String country = rs.getString("country");
            User user = new User(id, name, email, country);
            users.add(user);
        }
        return users;
    }


}
