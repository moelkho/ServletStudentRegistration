/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DataBaseConnection;
import entities.Record;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class RecordsDb {
    
  
static Connection CN = null;
   
   
   public static int addRecord(Record record)
   {  
      CN = DataBaseConnection.connect();
       int i=0;
       try {
       
       PreparedStatement pst = CN.prepareStatement("insert into records(studentname,studentcourse,studentfees)values(?,?,?)");
      
        pst.setString(1, record.getStudentName());
       pst.setString(2, record.getStudentCourse());
       pst.setDouble(3, record.getStudentfees());
       pst.executeUpdate();
       
              
       } catch (SQLException ex) {
           Logger.getLogger(RecordsDb.class.getName()).log(Level.SEVERE, null, ex);
       }
       try {
           CN.close();
       } catch (SQLException ex) {
           Logger.getLogger(RecordsDb.class.getName()).log(Level.SEVERE, null, ex);
       }
    return i;
   }
   
   
   
   public static HashSet<Record> getRecords()
   {   
       CN = DataBaseConnection.connect();
       int i=0;
   Record record;
   
   Set<Record> recordList = new HashSet<>();
       try {
       
       Statement st = CN.createStatement();
       
       String sql = "select * from records ";
      
       ResultSet rs = st.executeQuery(sql);
       
       while (rs.next())
               {
                    record = new Record();
                    
                    record.setStudentId(rs.getInt("id"));
                    record.setStudentName(rs.getString("studentname"));
                    record.setStudentCourse(rs.getString("studentcourse"));
                    record.setStudentfees(rs.getDouble("studentfees"));  
               
                    recordList.add(record);
               }
    
       
              
       } catch (SQLException ex) {
           Logger.getLogger(RecordsDb.class.getName()).log(Level.SEVERE, null, ex);
       }
       try {
           CN.close();
       } catch (SQLException ex) {
           Logger.getLogger(RecordsDb.class.getName()).log(Level.SEVERE, null, ex);
       }
    return (HashSet<Record>) recordList;
   }
    
      public static void deleteRecords(int i)
   {   
       CN = DataBaseConnection.connect();
      
   
       try {
       
      PreparedStatement pst = CN.prepareStatement("delete from records where id = ?");
       
       pst.setInt(i, i);
       
      pst.executeUpdate();
       
     
    
       
              
       } catch (SQLException ex) {
           Logger.getLogger(RecordsDb.class.getName()).log(Level.SEVERE, null, ex);
       }
       try {
           CN.close();
       } catch (SQLException ex) {
           Logger.getLogger(RecordsDb.class.getName()).log(Level.SEVERE, null, ex);
       }
   
   }
}
