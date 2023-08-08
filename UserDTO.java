package users;

public class UserDTO {

	String studentID;
	String nickname;

	public String getstudentID() {
		return studentID;
	}

	public void setstudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getnickname() {
		return nickname;
	}

	public void setnickname(String nickname) {
		this.nickname =nickname;
	}
}