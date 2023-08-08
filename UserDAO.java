package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DatabaseUtil;

public class UserDAO {
    Connection conn = DatabaseUtil.getConnection();

    public int join(String studentID, String nickname) {
        String SQL = "INSERT INTO users VALUES (?, ?)";
        try {
            // 각각의 데이터를 실제로 넣어준다.
            PreparedStatement pstmt = conn.prepareStatement(SQL);

            // 쿼리문의 ?안에 각각의 데이터를 넣어준다.
            pstmt.setString(1, studentID);
            pstmt.setString(2, nickname);

            // 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수
            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                // 데이터 삽입이 성공한 경우
                return 1;
            } else {
                // 데이터 삽입이 실패한 경우
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1; // 예외 발생 시
        }
    }

    public String getNicknameByStudentID(String studentID) {
        String SQL = "SELECT nickname FROM users WHERE studentID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, studentID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString("nickname");
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
