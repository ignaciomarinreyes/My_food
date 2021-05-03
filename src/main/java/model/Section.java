
package model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "section")
public class Section {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name", nullable = false)
    private String name;
    
    @ManyToMany(mappedBy="sections",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Item> items; 
    
    @ManyToOne()
    @JoinColumn(nullable = false, name = "id_menu", foreignKey = @ForeignKey(name = "fk_section_to_menu"))
    private Menu menu;
    
    

    public Section(Menu menu, String parameter) {
        this.name = parameter;
        this.menu = menu;
    }

    public Section() {

    }

    public String getName() {
        return this.name;
    }

    public Set<Item> getItems() {
        return items;
    }

    public int getId() {
        return this.id;
    }
}
