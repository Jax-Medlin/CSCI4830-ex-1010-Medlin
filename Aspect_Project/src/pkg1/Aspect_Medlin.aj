package pkg1;

public aspect Aspect_Medlin {
	pointcut classToTrace(): within(*App);
	
	pointcut MethodToTrace(): classToTrace() && execution(* pkg1.*App.get*(..));
	
	before(): MethodToTrace() {
		System.out.println("-->"
				+ thisJoinPointStaticPart.getSignature() + ", "
				+ thisJoinPointStaticPart.getKind() + ", "
				+ thisJoinPointStaticPart.getSourceLocation().getFileName() + ", "
				+ thisJoinPointStaticPart.getSourceLocation().getWithinType() + ", "
				+ thisJoinPointStaticPart.getSourceLocation().getLine());
	}
	after(): MethodToTrace() {
		System.out.println("\t<--" + thisJoinPointStaticPart.getSignature());
	}
}