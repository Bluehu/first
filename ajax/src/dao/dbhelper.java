package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class dbhelper {

	private static String driverStr = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String url = "jdbc:sqlserver://localhost:1433;databaseName=dt14_Project_Test(JSP)";
	private static String uid="huyuxiao";
	private static String pwd="123456";
	//ִ����ɾ�ģ���������Ӱ�������
	public static int update(String sql, Object[] arrP){
		int result = 0;
		Connection con = null;
		PreparedStatement pstm=null;
		try{
			Class.forName(driverStr);
			con = DriverManager.getConnection(url,uid,pwd);
			pstm = con.prepareStatement(sql);
		//�ж�sql����Ƿ����������
			if(arrP !=null){
				int i=1;
				for(Object obj:arrP){
					pstm.setObject(i++, obj);					
				}
			}
			result = pstm.executeUpdate();
		}
		catch(Exception ex){
			result = -1;
		}
		return result;
	}
	//ִ�в�ѯ�����ؽ����
	public static ResultSet query(String sql, Object[] arrP){
		ResultSet result = null;
		Connection con = null;
		PreparedStatement pstm=null;
		try{
			Class.forName(driverStr);
			con = DriverManager.getConnection(url,uid,pwd);
			pstm = con.prepareStatement(sql);
		//�ж�sql����Ƿ����������
			if(arrP !=null){
				int i=1;
				for(Object obj:arrP){
					pstm.setObject(i++, obj);					
				}
			}
			result = pstm.executeQuery();
		}
		catch(Exception ex){
			result = null;
		}
		return result;
	}
}
