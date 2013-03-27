# jaxb-inherit

Small JAXB plugin to allow specific JAXB generated classes to extend from a 
base class, or implement one or more interfaces. It is based on the inheritance
plugin found in JAXB2-commons, but does not require any external library.

## License

This code is licensed under the Apache-2.0 license, see 
<http://www.apache.org/licenses/LICENSE-2.0.html>.

## Building

The project can be built with Ant by running `ant build jar`. The resulting 
JAR can be found in the `generated` folder. Run `ant clean` to clean up all
generated stuff.

To make this project totally standalone, a copy of the `jaxb-xjc.jar` (taken
from the JAXB 2.2.6 reference implementation, see [1]) is included in this
project inside the `lib` directory.

## Usage

### Bindings

To use the jaxb-inherit plugin in your JAXB bindings, you need first to declare
it in the preamble of your bindings file:

	<jxb:bindings
	    version="1.0"
	    xmlns:jxb="http://java.sun.com/xml/ns/jaxb"
	    xmlns:xs="http://www.w3.org/2001/XMLSchema"
	    xmlns:xjc="http://java.sun.com/xml/ns/jaxb/xjc"
	    xmlns:inherit="http://www.lxtreme.nl/xml/ns/jaxb/inherit"
	    jxb:extensionBindingPrefixes="xjc inherit">
	...

After this, you can use it as follows:

    <jxb:bindings node="//xs:complexType[@name='MyComplexType']">
        <inherit:extends name="java.util.Observable" />
        <inherit:implements name="java.io.Serializable" />
    </jxb:bindings>

As a result, the generated `MyComplexType` class should extend from 
`java.util.Observable` and implement the `java.io.Serializable` interface.

### XJC

First, you need a JAXB installation unpacked somewhere on your local disk, and
have an environment setting named "JAXB_HOME" pointing to this location.

Add the "jaxb-inherit-1.0.0.jar" to the classpath of XJC, like 
`-classpath /path/to/jaxb-inherit-1.0.0.jar`.

Enable custom extensions and, most importantly, the jaxb-inherit extension by
adding `-extension -Xinherit` as arguments to your XJC script.

For convenience, a simple shell script is available in the root of this project
that shows one way of running XJC with the jaxb-inherit plugin enabled.

## References and links

1. JAXB reference implementation: <http://jaxb.java.net/>;
2. JAXB2-commons library: <https://jaxb2-commons.java.net>.