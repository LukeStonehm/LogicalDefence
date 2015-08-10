package za.co.lukestonehm.logicaldefence;

/**
 * Custom object that represents a fallacy
 */
public class Fallacy {
    private int pos;
    private String title, desc, example;


    public Fallacy(int pos, String title, String desc, String example) {
        this.pos = pos;
        this.title = title;
        this.desc = desc;
        this.example = example;
    }

    public int getPos() {
        return pos;
    }

    public void setPos(int pos) {
        this.pos = pos;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getExample() {
        return example;
    }

    public void setExample(String example) {
        this.example = example;
    }

    @Override
    public String toString() {
        return pos + "\n" + title + "\n" + desc;
    }

    public String getShareString() {
        return title + "\n\n" + desc + "\n\n" + example;
    }
}
