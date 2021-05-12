package model;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;


@Entity
@Table(name = "user")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "fullName", nullable = false)
    private String fullName;
       
    @Column(name = "nickName", nullable = false)
    private String nickName;
    
    @Column(name = "password", nullable = false)
    private String password;
    
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Set<Menu> menus;
    
    public User() {

    }

    public User(String nickname, String password, String fullname) {
        this.nickName = nickname;
        this.password = password;
        this.fullName = fullname;
    }

    public int getId() {
        return id;
    }
    
    
    
}
