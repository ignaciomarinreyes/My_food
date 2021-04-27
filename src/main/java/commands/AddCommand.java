package commands;

public class AddCommand extends FrontCommand {

    String[] stringValues = {"menuName", "itemName", "sectionName"};

    @Override
    public void process() {
        int id = Integer.parseInt(request.getParameter("id"));
        String parameter = recoverParameter();
        if (parameter == null) {
            forward("/unknown.jsp");
        } else {
            switch (parameter) {
                case "menuName":
                    //FUNCION DE AÑADIR MENU
                    break;
                case "itemName":
                    //FUNCION DE AÑADIR ITEM
                    break;
                case "sectionName":
                    //FUNCION DE AÑADIR SECTION
                    break;
                default:
                    forward("/unknown.jsp");
                    break;
            }
        }
    }

    private String recoverParameter() {
        for (int i = 0; i < stringValues.length; i++) {
            if (request.getParameter(stringValues[i]) != null) return request.getParameter(stringValues[i]);
        }
        return null;
    }
}
