package model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import persistence.dao.DAOItem;


@Entity
@Table(name = "menu")
public class Menu {
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name", nullable = false)
    private String name;
       
    @ManyToMany(fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinTable(name = "MenuAndItem", joinColumns = @JoinColumn(name = "id_menu"),
            inverseJoinColumns = @JoinColumn(name = "id_item"),
            foreignKey = @ForeignKey(name = "fk_MenuAndItem_to_menu"),
            inverseForeignKey = @ForeignKey(name = "fk_MenuAndItem_to_item"))
    private Set<Item> items;
    
    @ManyToOne()
    @JoinColumn(nullable = false, name = "id_user", foreignKey = @ForeignKey(name = "fk_menu_to_user"))
    private User user;
    
    @OneToMany(mappedBy = "menu", fetch = FetchType.EAGER)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Set<Section> sections;

    public Menu(String name, User u) {
        this.name = name;
        user = u;
        items = new HashSet<Item>();
    }

    public Menu() {

    }

    public String getName() {
        return name;
    }

    public void addItem(Item item) {
    }

    public void setName(String name) {
        this.name = name;
    }


    public Set<Item> getItems() {
        return items;
    }

    public Set<Section> getSections(){
        return sections;
    }

    public void addSection(Section section) {
        this.sections.add(section);
    }

    public int getId() {
        return this.id;
    }
}
