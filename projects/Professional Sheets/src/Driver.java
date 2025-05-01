import java.sql.*;
import java.util.Scanner;
import java.util.ArrayList;
/*2. There should be a place where people can add students into the system. done
3. There should be a place where people can add events into the system. done
4. There should be a place where people can enter attendance for an event. done
5. There should be a place where people can get a report on who attended a specific event. done 
6. There should be a place where people can get a report on how many PD Points a student has. done
 */
public class Driver {
   
    public static void main(String[] args) {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet results = null;
    Scanner input = new Scanner(System.in);
    boolean running = true;
    while(running) {
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pd_point_tracker","root", "F**~<|*m0f0RE");
            String statement = "";
            System.out.println("Hi user, how may I help you today?");
            String user = input.nextLine(); 

            if(user.contains("done") || user.contains("no")) {
                running = false;
                break;
            } else if(user.contains("add") && user.contains("student")) {
                statement = "insert into pd_students (name, year, requiredClass) VALUES";
                System.out.println("Name of the student?");
                String name = input.nextLine();
                while(!name.matches("[ a-zA-Z_]*")) {
                    System.err.println("Not a valid name!");
                    name = input.nextLine();
                }
                System.out.println("Year of student?");
                String year = input.nextLine();
                boolean yearCheck = (year.equals("Freshman") || year.equals("Sophomore") || year.equals("Junior") || year.equals("Senior") || year.equals("Graduate"));
                while(!yearCheck) {
                    System.err.println("Not a valid year!");
                    year = input.nextLine();
                }
                System.out.println("Required class for PD points?");
                String requiredClass = input.nextLine();
                while(!requiredClass.matches("[a-zA-Z_]*-[0-9]*")) {
                    System.err.println("Not a valid class!");
                    requiredClass = input.nextLine();
                }
                statement += " (" + "\"" + name + "\"" + ", " + "\"" + year + "\"" + ", " + "\"" + requiredClass + "\"" + ")";
                stmt = conn.prepareStatement(statement);
                stmt.executeUpdate();
            } else if(user.contains("add") && user.contains("event")) {
                statement = "insert into pd_events (name, date, pd_points) VALUES";
                System.out.println("Name of the event?");
                String name = input.nextLine();
                while(!name.matches("[ a-zA-Z_]*")) {
                    System.err.println("Not a valid name!");
                    name = input.nextLine();
                }
                System.out.println("date of the event in dashes?");
                String date = input.nextLine();
                while(date.matches("[1812-2200]-[0-12]-[0-31]")) {
                    System.err.println("Not a valid date!");
                    date = input.nextLine();
                }
                System.out.println("Number of PD points for attending?");
                int pdPoints = input.nextInt();
                statement += " (" + "\"" + name + "\"" + ", " + "\"" + date + "\"" + ", " + "\"" + pdPoints + "\"" + ")";
                stmt = conn.prepareStatement(statement);
                stmt.executeUpdate();
            } else if(user.contains("enter") || user.contains("attendance")) {
                statement = "insert into pd_attendance (student_id, event_id, attendence) VALUES";
                stmt = conn.prepareStatement("select * from pd_students");
                results = stmt.executeQuery();
                ArrayList<String> names = new ArrayList<String>();
                while (results.next()) {
                    names.add(results.getString(2));
                    }
                for(String s: names) {
                System.out.println(s);
                }
                System.out.println("Which student?");
                String student = input.nextLine();
                while(!names.contains(student)) {
                    System.err.println("Not a vaild student");
                    student = input.nextLine();
                }
                int studentId = 0;
                for (int i = 0; i < names.size(); i++) {
                    if(names.get(i).equals(student)) {
                        studentId = i+1;
                        break;
                    }
                }
                stmt = conn.prepareStatement("select * from pd_events");
                results = stmt.executeQuery();
                ArrayList<String> events = new ArrayList<String>();
                while (results.next()) {
                    events.add(results.getString(2));
                    }
                for(String s: events) {
                System.out.println(s);
                }
                System.out.println("Which event?");
                String event = input.nextLine();
                while(!events.contains(event)) {
                    System.err.println("Not a vaild event");
                    event = input.nextLine();
                }
                int eventId = 0;
                for (int i = 0; i < events.size(); i++) {
                    if(events.get(i).equals(event)) {
                        eventId = i+1;
                        break;
                    }
                }
                System.out.println("Did " + student + " attend " + event + "?");
                boolean attendance = (input.nextLine().toLowerCase().contains("yes") || input.nextLine().toLowerCase().contains("y") || !input.nextLine().toLowerCase().contains("no") || !input.nextLine().toLowerCase().contains("n"));
                statement += " (" + studentId + ", "  + eventId + ", " + attendance + ")";
                stmt = conn.prepareStatement(statement);
                stmt.executeUpdate();
            } else if((user.contains("attended") || user.contains("at")) && user.contains("who")) {
                statement = "select attendence from pd_attendance where";
                stmt = conn.prepareStatement("select * from pd_students");
                results = stmt.executeQuery();
                ArrayList<String> names = new ArrayList<String>();
                while (results.next()) {
                    names.add(results.getString(2));
                    }
                stmt = conn.prepareStatement("select * from pd_events");
                results = stmt.executeQuery();
                ArrayList<String> events = new ArrayList<String>();
                while (results.next()) {
                    events.add(results.getString(2));
                    }
                for(String s: events) {
                System.out.println(s);
                }
                System.out.println("Which event are you talking about?");
                String event = input.nextLine();
                while(!events.contains(event)) {
                    System.err.println("Not a vaild event");
                    event = input.nextLine();
                }
                int eventId = 0;
                for (int i = 0; i < events.size(); i++) {
                    if(events.get(i).equals(event)) {
                        eventId = i+1;
                        break;
                    }
                }
                statement += " event_id = " + eventId;
                stmt = conn.prepareStatement(statement);
                results = stmt.executeQuery();
                int i = 0;
                while (results.next()) {
                    if(results.getString(1).equals("1")) {
                    System.out.println(names.get(i) + " did.");
                    } else {
                    System.out.println(names.get(i) + " did not.");
                    }
                    i++;
                    }
            } else if(user.contains("how many") && user.contains("PD points")) {
                statement = "select attendence from pd_attendance where";
                stmt = conn.prepareStatement("select * from pd_events");
                results = stmt.executeQuery();
                ArrayList<Integer> events = new ArrayList<Integer>();
                while (results.next()) {
                    events.add(results.getInt(4));
                    }
                stmt = conn.prepareStatement("select * from pd_students");
                results = stmt.executeQuery();
                ArrayList<String> names = new ArrayList<String>();
                while (results.next()) {
                    names.add(results.getString(2));
                    }
                for(String s: names) {
                System.out.println(s);
                }
                System.out.println("Which student are you checking?");
                String student = input.nextLine();
                while(!names.contains(student)) {
                    System.err.println("Not a vaild student");
                    student = input.nextLine();
                }
                int studentId = 0;
                for (int u = 0; u < names.size(); u++) {
                    if(names.get(u).equals(student)) {
                        studentId = u+1;
                        break;
                    }
                }
                statement += " student_id = " + studentId;
                stmt = conn.prepareStatement(statement);
                results = stmt.executeQuery();
                int index = 0;
                int pd_points = 0;
                while (results.next()) {
                        String r = results.getString(1);
                        if(r.equals("1")) {
                           pd_points += events.get(index);
                        }
                        index++;
                    }
                System.out.println(student + " has " + pd_points + " PD points.");
            }
            
            } catch (SQLException e) {
                //System.out.println("SQL bugged out, try again");
                e.printStackTrace();
            }
            
    }
    try {
    if (results != null) results.close();
    if (stmt != null) stmt.close();
    if (conn != null) conn.close();
    input.close();
    } catch (SQLException e) {
    e.printStackTrace();
    }
    }
    }
    
    

