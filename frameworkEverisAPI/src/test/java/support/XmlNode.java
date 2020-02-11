package support;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections4.MultiValuedMap;
import org.apache.commons.collections4.multimap.ArrayListValuedHashMap;
import org.apache.commons.lang.StringUtils;


public class XmlNode implements Comparable<XmlNode> {

	private String name;

	private String value;

	private Integer level = 0;

	private Long sequence = 0L;

	private Integer insertOrdem = 0;

	
	private String customName;
	
	private MultiValuedMap<String, XmlNode> child = new ArrayListValuedHashMap<>();
	
	private Map<String, String> attributes = new HashMap<>();
	
	public void addChild(String key, XmlNode node) {
		child.put(key, node);
	}
	
	public XmlNode getChild(String key, Integer position) {
		if(child.get(key) != null && !child.get(key).isEmpty()) {
			if(child.get(key).toArray().length > position)
				return (XmlNode) child.get(key).toArray()[position];
		}
		return null;
	}
	
	public void addAttribute(String key, String value) {
		attributes.put(key, value);
	}

	@Override
	public int compareTo(XmlNode other) {
		int sequenceCompare = this.sequence.compareTo(other.getSequence());
		if (sequenceCompare == 0) {
			if(this.sequence==0 &&  this.name.equalsIgnoreCase(other.getName()))
				return this.level.compareTo(other.getLevel());
			
			if (this.sequence==0
					||(!StringUtils.isEmpty(other.getCustomName()) && !StringUtils.isEmpty(this.customName)) && !this.customName.equals(other.getCustomName()))
				return this.insertOrdem.compareTo(other.getInsertOrdem());
			else
				return this.level.compareTo(other.getLevel());
		}

		return sequenceCompare;
	}

	@Override
	public boolean equals(Object arg0) {

		if (this.sequence == null || (this.sequence == 0))
			return false;
		else
			return compareTo((XmlNode) arg0) == 0;
	}

	@Override
	public int hashCode() {
		return this.name.charAt(0);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Long getSequence() {
		return sequence;
	}

	public void setSequence(Long sequence) {
		this.sequence = sequence;
	}

	public Integer getInsertOrdem() {
		return insertOrdem;
	}

	public void setInsertOrdem(Integer insertOrdem) {
		this.insertOrdem = insertOrdem;
	}

	public String getCustomName() {
		return customName;
	}

	public void setCustomName(String customName) {
		this.customName = customName;
	}

	public MultiValuedMap<String, XmlNode> getChild() {
		return child;
	}

	public void setChild(MultiValuedMap<String, XmlNode> child) {
		this.child = child;
	}

	public Map<String, String> getAttributes() {
		return attributes;
	}

	public void setAttributes(Map<String, String> attributes) {
		this.attributes = attributes;
	}
}
