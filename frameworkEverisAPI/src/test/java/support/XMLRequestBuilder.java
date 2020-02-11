package support;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.collections4.MultiValuedMap;
import org.apache.commons.collections4.multimap.ArrayListValuedHashMap;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class XMLRequestBuilder {
	private static final String SPACE = " ";

	private MultiValuedMap<String, XmlNode> nodes;
	
	
    
    private static final Logger logger =
            LoggerFactory.getLogger(XMLRequestBuilder.class);    

    public XMLRequestBuilder() {
        this.nodes = new ArrayListValuedHashMap<>();
    }
    
    public void add(String name, Object value, long sequence, String customName) {
		this.add(name, value);
	}

    public void add(String name, Object value, long sequence) {
    	this.add(name, value, sequence, "");
    }
    public void add(String name, Object value) {

        String[] arrayNames = name.split("\\.");

        XmlNode refNode = null;
        for(int i=0; i < arrayNames.length; i++){
        	if(i == (arrayNames.length-1)) {
        		if(isAttribute(arrayNames[i])) {
        			refNode.addAttribute(getAttributeKey(arrayNames[i]), (String)value);
        		} else {
        			XmlNode node = new XmlNode();
        			node.setName(arrayNames[i]);
        			node.setValue(value.toString());
        			if(refNode != null)
        				refNode.addChild(arrayNames[i], node);
        			else
        				nodes.put(arrayNames[i], node);
        		}
        	} else {
        		// validate if node exists and get this
            	String key = arrayNames[i];
            	if(isArray(arrayNames[i])) {
					key = getArrayKey(arrayNames[i]);
            	}
            	Integer position = getArrayPosition(arrayNames[i]);
            	
            	if(refNode == null) {
            		XmlNode aux = null;
            		if(isArray(arrayNames[i])) {
            			aux = getArrayNode(null, key, position);
            		} else {
            			if(!nodes.get(key).isEmpty())
            				aux = nodes.get(key).iterator().next();
            		}
            		if(aux == null) {
            			aux = new XmlNode();
            			aux.setName(key);
            			nodes.put(key, aux);
            		} else {
            			aux.setName(key);
            		}
            		refNode = aux;
            	} else {
            		XmlNode aux = null;
            		if(isArray(arrayNames[i])) {
            			aux = getArrayNode(refNode, key, position);
            		} else {
            			if(!refNode.getChild().get(key).isEmpty())
            				aux = refNode.getChild().get(key).iterator().next();
            		}
            		if(aux == null) {
            			aux = new XmlNode();
            			aux.setName(key);
            			refNode.addChild(key, aux);
            		} else {
            			aux.setName(key);
            		}
            		refNode = aux;
            	}
        	}
        }
    }
    
    private XmlNode getArrayNode(XmlNode refNode, String key, Integer position) {
    	XmlNode aux = null;
    	if (refNode != null) {
    		if(refNode.getChild().get(key).size() > position) {
    			aux = (XmlNode) refNode.getChild().get(key).toArray()[position];
    		} else {
    			for (int i = refNode.getChild().get(key).size(); i <= position; i++) {
    				XmlNode node = new XmlNode();
    				node.setName(key);
    				refNode.getChild().put(key, node);
    				if (i == position) 
    					aux = node;
    			}
    		}
    	} else {
    		if(nodes.get(key).size() > position) {
    			aux = (XmlNode) nodes.get(key).toArray()[position];
    		} else {
    			for (int i = nodes.get(key).size(); i <= position; i++) {
    				XmlNode node = new XmlNode();
    				node.setName(key);
    				nodes.put(key, node);
    				if (i == position) 
    					aux = node;
    			}
    		}
    	}
    	return aux;
    }
    
    private Boolean isAttribute(String key) {
    	if (key.startsWith("*")) 
    		return true;
    	return false;
    }
    
    private String getAttributeKey(String key) {
    	return key.replace("*", StringUtils.EMPTY);
    }
    
    private Boolean isArray(String key) {
		return (key.contains("[") && key.contains("]"))? true : false;
	}
    
    private String getArrayKey(String key) {
		return key.substring(0, key.indexOf("["));
	}
    
    private Integer getArrayPosition(String key) {
    	if (key.contains("[") && key.contains("]") && (key.lastIndexOf("[") +1 <= key.lastIndexOf("]")))
    		return Integer.parseInt(key.substring(key.lastIndexOf("[") + 1, key.lastIndexOf("]")));
    	else 
    		return 0;
	}
    
    public void addAll(Map<String, Object> fields) {
        if(fields != null && !fields.isEmpty()){
            Iterator<Entry<String, Object>> it = fields.entrySet().iterator();

            while(it.hasNext()){
                Entry<String, Object> next = it.next();
                add(next.getKey(), next.getValue(), 0, null);
            }
        }
    }
    
	public void addAll(MultiValuedMap<String, Object> fields) {
		if(fields != null && !fields.isEmpty()){
            Iterator<Entry<String, Object>> it = fields.entries().iterator();

            while(it.hasNext()){
                Entry<String, Object> next = it.next();
                add(next.getKey(), next.getValue(), 0, null);
            }
        }
	}

    @SuppressWarnings({ "unchecked", "rawtypes" })
    public String generate(String parent) throws Exception {

        List<XmlNode> sortedNodes = new ArrayList(nodes.values());
       // Collections.sort(sortedNodes);

        StringBuilder xml = new StringBuilder();

        try{
        	if(parent != null)
        		xml.append("<" + parent + ">");

            for(XmlNode node : sortedNodes){
            	printNode(xml, node);
            }

            if(parent != null)
            	xml.append("</" + parent + ">");

        }catch(Exception ex){
        	logger.error("Error on build XML builder: {}", xml, ex);
            throw new Exception(ex.getMessage());
        }

        return xml.toString();
    }
    
    private void printNode(StringBuilder xml, XmlNode node) {
    	xml.append("<" + node.getName());
    	if(!node.getAttributes().isEmpty()) {
    		for(String key : node.getAttributes().keySet()){
    			xml.append(SPACE)
    				.append(key)
    				.append("=\"")
    				.append(node.getAttributes().get(key))
    				.append("\"")
    				.append(SPACE);
    		}
    	}
    	xml.append(">");
    	if(!node.getChild().isEmpty()) {
    		for (String nodeKey : node.getChild().keySet()) {
    			for(int i = 0; i < node.getChild().get(nodeKey).size(); i++)
    				printNode(xml, (XmlNode) node.getChild().get(nodeKey).toArray()[i]);
    		}
    	} else {
    		xml.append(node.getValue());
    	}
    	xml.append("</" + node.getName() + ">");
    }

}
