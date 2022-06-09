import javax.swing.*;

import java.awt.event.*;
import java.awt.*;

import java.sql.*;
import java.io.*;
import java.lang.Exception;



public class Login implements ActionListener
{
	JFrame f;
	JLabel l,l1,l2;
	JButton b1,b2,b3;
	JPanel p,pl,p1,p2,pb,plr;
	JTextField tf1,tf2;
	Font ft,ft1;
	void connect()
	{
		String un=" ";
		String pf1=" ";
		String cn=tf1.getText();
		String mb=tf2.getText();
		Connection c=null;
	      	Statement s=null;
      		ResultSet rs=null;
		try
		{	
			Class.forName("oracle.jdbc.driver.OracleDriver");
	       		c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","project","Ashmi0512*");
	       		s=c.createStatement();
       			rs=s.executeQuery("select * from details where consumerno='"+cn+"'");
       			while(rs.next())
       			{
        			un=rs.getString("consumerno");
         			un=un.trim();
         			pf1=rs.getString("mobile_no");
         			pf1=pf1.trim();
       			}
       			if((cn.equals(un))&&(mb.equals(pf1)))
       			{
        			f.dispose(); 
		       		Printprofile pp=new Printprofile(cn);
        			pp.printprofile();
       			}
       			else
       			{
        			JOptionPane.showMessageDialog(f, "Invalid Consumer Number or Moblie Number!");
        			tf1.setText("");
        			tf2.setText("");
       			}
		}
		catch(SQLException ae)
      		{
			System.out.println(ae);
 		}
		catch(ClassNotFoundException ee)
		{
			System.out.println(ee);
		}	
		catch(NumberFormatException eee)
      		{
			System.out.println(eee);
 		}
	
	}
	public void login()
	{
		f =new JFrame();
		f.setContentPane(new JLabel(new ImageIcon("loginimg.jpg")));
		f.setBackground(new Color(0,0,0));
		p= new JPanel();
 		pl= new JPanel();
		p1= new JPanel();
		p2= new JPanel();
		plr= new JPanel();
 		l= new JLabel("LOGIN");
		pl.add(l);
		l1= new JLabel("Consumer Number  :");	
		l1.setForeground(Color.WHITE);
		p1.add(l1);
		l2= new JLabel("Moblie Number         :");
		l2.setForeground(Color.WHITE);
		p2.add(l2);
		ft = new Font("TimesRoman",Font.BOLD,35);
		l.setFont(ft);
		l.setForeground(new Color(3, 98, 252)); 
		tf1= new JTextField(10);
		p1.add(tf1);
		tf2= new JTextField(10);
		p2.add(tf2);
		ft1 = new Font("Helvetica",Font.BOLD,12);
		p.setPreferredSize(new Dimension(500,500));
		p.add(pl);
		p.add(p1);
 		p.add(p2);
		pb= new JPanel();
		b1 = new JButton("Login");
		b1.addActionListener(this);
		b1.setBackground(new Color(32, 102, 168));
		b1.setForeground(Color.WHITE);
		b1.setPreferredSize(new Dimension(80,30));	
		pb.add(b1);
		b2 = new JButton("Cancel");
      	b2.addActionListener(this);
		b2.setBackground(Color.ORANGE);
		b2.setForeground(Color.WHITE);
		b2.setPreferredSize(new Dimension(80,30));
      	pb.add(b2);
		p.add(pb);
		f.add(p);
		p.setLayout(new GridLayout(6,1));
		f.setLayout(new FlowLayout());
		f.setSize(1200,720);
		f.setVisible(true);
		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		pl.setBackground(new Color(0,0,0));
		p1.setBackground(new Color(0,0,0));
		p2.setBackground(new Color(0,0,0));
		p.setBackground(new Color(0,0,0));
		pb.setBackground(new Color(0,0,0));
	}
	public void actionPerformed(ActionEvent e)
	{
    		if(e.getSource()==b1)
    		{
			connect();
		}
		else
       		{
        		JOptionPane.showMessageDialog(f, "Invalid Username or Password");
        		tf1.setText("");
        		tf2.setText("");
       		}
	}
	
	public static void main(String[]args)

	{
    		Login l = new Login();
    		l.login();
	}
}

class Printprofile implements ActionListener
{
	String nm=new String();
	String cn=new String();
	String ge=new String();
	String dte=new String();
	String adr=new String();
	String em=new String();
	String mn=new String();
	String ps=new String();
	String u=new String();
    Connection c=null;
    Connection cp=null;
    Statement s=null;
    Statement st=null;
    ResultSet rs=null;
    ResultSet rp=null;
    Connection cj=null;
    Statement sj=null;
    ResultSet rj=null;
	JFrame f;
	JLabel l,l1,l2,l7,l3,l4,l5,l6,l8,ll;
	JButton b1,b2,b3;
	JRadioButton br1,br2;
	JPanel p,pl,p1,p2,pb,p7,p3,p4,p5,p6,p8,pc;
	JTextField tf1,tf2,tf3,tf4,tf5,tf6;
	Font ft,ft1;
	String x=new String();
	public Printprofile(String cn)
	{
		x=cn;
	}
	public void printprofile()
	{
		try
		{
        		Class.forName("oracle.jdbc.driver.OracleDriver");
			c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","project","Ashmi0512*");
			s=c.createStatement();
			System.out.println("connected");
			rs=s.executeQuery("select * from details where consumerno='"+x+"'");
			while(rs.next())
			{
				nm=rs.getString("c_name");
				nm=nm.trim();
				cn=rs.getString("consumerno");
        			cn=cn.trim();
        			ge=rs.getString("gender");
        			ge=ge.trim();
        			dte=rs.getString("date_of_conn");
        			dte=dte.trim();
        			adr=rs.getString("address");
        			adr=adr.trim();
        			em=rs.getString("email");
        			em=em.trim();
        			mn=rs.getString("mobile_no");
        			mn=mn.trim();
				ps=rs.getString("payment_status");
				ps=ps.trim();
			}
		}
		catch(Exception ae)
		{
			System.out.println(ae);
      	}
      	f=new JFrame();
		f.setContentPane(new JLabel(new ImageIcon("loginimg.jpg")));
		p=new JPanel();
		pl= new JPanel();
		pl.setBackground(Color.BLACK);
		p1= new JPanel();
		p2= new JPanel();
		p3= new JPanel();
		p4= new JPanel();
		p5= new JPanel();
		p6= new JPanel();
		p7= new JPanel();
		p8= new JPanel();
		l= new JLabel("My Profile");
		ft = new Font("TimesRoman",Font.BOLD,35);
		l.setFont(ft);
		l.setForeground(new Color(3, 98, 252));
		pl.add(l);
		l1= new JLabel("Name                      	:   "+nm);
		p1.add(l1);
		l1.setForeground(Color.WHITE);
		l2= new JLabel("Consumer Number          	:   "+cn);
		p2.add(l2);
		l2.setForeground(Color.WHITE);
		l7= new JLabel("Gender                                 :   "+ge);
		p7.add(l7);
		l7.setForeground(Color.WHITE);
		l3= new JLabel("Date of Connection 	:"+dte);
		p3.add(l3);
		l3.setForeground(Color.WHITE);
		l4= new JLabel("Current Address         :"+adr);
		p4.add(l4);
		l4.setForeground(Color.WHITE);
		l5= new JLabel("Email          : "+em);
		p5.add(l5);
		l5.setForeground(Color.WHITE);
		l6= new JLabel("Mobile Number       	:   "+mn);
		p6.add(l6);
		l6.setForeground(Color.WHITE);
		l8= new JLabel("Payment Status                     :        "+ps);
		p8.add(l8);
		l8.setForeground(Color.WHITE);
		p.add(pl);
		p.add(p1);
		p.add(p2);
		p.add(p7);
		p.add(p3);
		p.add(p4);
		p.add(p5);
		p.add(p6);
		p.add(p8);
		p.setBackground(Color.BLACK);
		p1.setBackground(Color.BLACK);
		p2.setBackground(Color.BLACK);
		p3.setBackground(Color.BLACK);
		p4.setBackground(Color.BLACK);
		p5.setBackground(Color.BLACK);
		p6.setBackground(Color.BLACK);
		p7.setBackground(Color.BLACK);
		p8.setBackground(Color.BLACK);
		pb= new JPanel();
		b1 = new JButton("History");
		b1.setBackground(new Color(32, 102, 168));
		b1.setForeground(Color.WHITE);
		b1.setPreferredSize(new Dimension(80,30));
		pb.add(b1);
		b3 = new JButton("Bill");
		b3.setBackground(new Color(32, 102, 168));
		b3.setForeground(Color.WHITE);
		b3.setPreferredSize(new Dimension(80,30));
		pb.add(b3);
		b2 = new JButton("Logout");
		b2.setBackground(Color.ORANGE);
		b2.setForeground(Color.WHITE);
		b2.setPreferredSize(new Dimension(80,30));
		pb.add(b2);
		pc= new JPanel();
      	b1.addActionListener(this);
      	b2.addActionListener(this);
      	b3.addActionListener(this);
		p.add(pb);
		p.add(pc);
		f.add(p);
		pb.setBackground(Color.BLACK);
		p.setLayout(new GridLayout(11,1));
		f.setLayout(new FlowLayout());
		f.setSize(1200,720);
		f.setVisible(true);

		pc.setBackground(Color.BLACK);
 		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public void actionPerformed(ActionEvent e)
	{
		if((e.getSource()==b3))
		{
			try
			{
        		if(ps.equals("No"))
				{
					String amount="CALL total_calc("+cn+")";
					CallableStatement cstm=c.prepareCall(amount+" INTO ?");
					cstm.registerOutParameter(1,Types.NUMERIC);
					cstm.execute();
					int res=cstm.getInt(1);
					System.out.println(res);
      				int a=s.executeUpdate("update payment set total='"+res+"' where consumerno='"+x+"'");
      				f.dispose();
     				Paybill p1=new Paybill(x);
    		  		p1.paybill();
      			}
      			else
      			{
        			JOptionPane.showMessageDialog(f, "No pending payments!");
      			}
			}
			catch(Exception ee)
			{
			}

    	}
        else if((e.getSource()==b2))
        {
          f.dispose();
          Login l1=new Login();
          l1.login();
        }
        else if((e.getSource()==b1))
        {
          History h1=new History(x);
          h1.history();
        }
    		
   	} 

} 


class Paybill implements ActionListener
{
	JTextField tf1;
	JFrame f;
	JButton ba1,ba2;
	JLabel jl1,jl2,jl3,jl4,jl5,jl6,jl7,jl8,jl9,jl10;
	JPanel p1,p2;
	
  	String nm=new String();
	String cn=new String();
	String ge=new String();
	String dte=new String();
  	Connection c=null;
  	Statement s=null;
  	ResultSet rs=null;
  	String x=new String();
	public Paybill(String cn)
	{
		x=cn;
	}
	public void paybill()
	{
    	try
		{
      		Class.forName("oracle.jdbc.driver.OracleDriver");
			c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","project","Ashmi0512*");
			s=c.createStatement();
			System.out.println("connected");
			rs=s.executeQuery("select * from payment where consumerno='"+x+"'");
			while(rs.next())
			{
				      nm=rs.getString("c_read");
				      nm=nm.trim();
				      cn=rs.getString("consumerno");
        			cn=cn.trim();
        			ge=rs.getString("p_read");
        			ge=ge.trim();
        			dte=rs.getString("total");
        			dte=dte.trim();
			}
		}
		catch(Exception ae)
		{
			System.out.println(ae);
      	}
	    f=new JFrame("Payment");
		f.setContentPane(new JLabel(new ImageIcon("loginimg.jpg")));
	    ba1=new JButton("Pay Now");
		ba2=new JButton("Cancel");
		ba2.addActionListener(this);
        ba1.addActionListener(this);
        p1=new JPanel();
		ba2.setBackground(Color.BLUE);
		ba2.setForeground(Color.WHITE);
	    p1.setLayout(new FlowLayout());
	    ba1.setBackground(Color.BLUE);
	    ba1.setForeground(Color.WHITE);
	    jl1=new JLabel("PAYMENT DETAILS");
		jl1.setForeground(Color.ORANGE);
	    jl1.setFont(new Font("Verdana",Font.PLAIN,20));
 	    jl2=new JLabel("consumer number:    "+cn);
		jl2.setForeground(Color.WHITE);
	    jl2.setFont(new Font("Verdana",Font.PLAIN,15));
 	    jl3=new JLabel("Current reading:      "+nm);
		jl3.setForeground(Color.WHITE);
	    jl3.setFont(new Font("Verdana",Font.PLAIN,15));
		jl3.setForeground(Color.WHITE);
	    jl4=new JLabel("Previous reading:      "+ge);
		jl4.setForeground(Color.WHITE);
	    jl4.setFont(new Font("Verdana",Font.PLAIN,15));
  	    jl5=new JLabel("  Amount:             '"+dte+"'");
		jl5.setForeground(Color.WHITE);
	    jl5.setFont(new Font("Verdana",Font.PLAIN,15));
        System.out.println("\n");
 	    p1.add(jl1); p1.add(jl2); p1.add(jl3); p1.add(jl4); p1.add(jl5);
	    p1.add(ba1);
	    p1.setBounds(10,10,300,200);
	    f.add(p1);
		p1.setBackground(Color.BLACK);
	    f.setSize(500,500);
        p1.setLayout(new GridLayout(6,1));
		f.setLayout(new FlowLayout());
		f.setSize(1200,720);
	    f.setVisible(true);
	    f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public void actionPerformed(ActionEvent e)
	{
     	if(e.getSource()==ba1)
		{
 			int a=JOptionPane.showConfirmDialog(f, "Are you sure?");
      		if(a==JOptionPane.YES_OPTION)
			{
        		try
				{
        			int b=s.executeUpdate("update details set payment_status='Yes' where consumerno='"+x+"'");
        			System.out.println("updating..........");
					JOptionPane.showMessageDialog(f, "Payment is successfull!");
        			f.dispose();
					Printprofile p=new Printprofile(cn);
					p.printprofile();
        		}
        		catch(Exception ee)
        		{}
			}
      		else if(a==JOptionPane.NO_OPTION)
			{
				f.dispose();
				Printprofile p=new Printprofile(cn);
				p.printprofile();
			}
			else
			{
				
				Paybill p1=new Paybill(cn);
				p1.paybill();
			}
		}
     
    }
}


class History implements ActionListener
{
	JTextField tf1;
	JFrame f;
	JButton ba1,ba2;
	JLabel jl1,jl2,jl3,jl4,jl5,jl6,jl7,jl8,jl9,jl10;
	JPanel p1,p2,p3,p;
	
  	String nm=new String();
	String cn=new String();
	String ge=new String();
	String dte=new String();
  	Connection c=null;
  	Statement s=null;
  	ResultSet rs=null;
  	String x=new String();
	public History(String cn)
	{
		x=cn;
	}
	public void history()
	{
    	try
		{
      		Class.forName("oracle.jdbc.driver.OracleDriver");
			c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","project","Ashmi0512*");
			s=c.createStatement();
			System.out.println("connected");
			rs=s.executeQuery("select * from history where consumerno='"+x+"'");
			while(rs.next())
			{
				      nm=rs.getString("resp_date");
				      nm=nm.trim();
				      cn=rs.getString("resp_amount");
        			cn=cn.trim();
			}
		}
		catch(Exception ae)
		{
			System.out.println(ae);
      	}
	    f=new JFrame("History");
		f.setContentPane(new JLabel(new ImageIcon("loginimg.jpg")));
	    ba1=new JButton("Profile");
        ba1.addActionListener(this);
        p1=new JPanel();
		p=new JPanel();
		p2=new JPanel();
		p3=new JPanel();
	    p1.setLayout(new FlowLayout());
	    ba1.setBackground(Color.BLUE);
	    ba1.setForeground(Color.WHITE);
        ba1.setPreferredSize(new Dimension(80,30));
	    jl1=new JLabel("		PAYMENT HISTORY");
	    jl1.setFont(new Font("Verdana",Font.PLAIN,20));
		jl1.setForeground(Color.ORANGE);
 	    jl2=new JLabel("Date:    "+nm+"   Amount:     '"+cn+"'");
	    jl2.setFont(new Font("Verdana",Font.PLAIN,15));
		jl2.setForeground(Color.WHITE);
 	    p1.add(jl1); p2.add(jl2); 
	    p3.add(ba1);
		p.add(p1);
		p.add(p2);
		p.add(p3);
		p.setBackground(Color.BLACK);
		p1.setBackground(Color.BLACK);
		p2.setBackground(Color.BLACK);
		p3.setBackground(Color.BLACK);
		f.setBackground(Color.RED);
	    p.setBounds(10,100,300,200);
	    f.add(p);
	    f.setSize(500,500);
        p.setLayout(new GridLayout(6,1));
		f.setLayout(new FlowLayout());
		f.setSize(1200,720);
	    f.setVisible(true);
	    f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public void actionPerformed(ActionEvent e)
	{
     	if(e.getSource()==ba1)
		{
        	f.dispose();
			Printprofile p=new Printprofile(x);
			p.printprofile();
		}
    }
}      