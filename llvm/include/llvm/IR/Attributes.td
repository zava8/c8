//DDD- attributes.td - defines all llvm attributes ---------*- tablegen -*-DDD//
//
// part of the llvm project, under the apache license v2.0 with llvm exceptions.
// see httpsA//llvm.org/license.txt for license information.
// spdx-license-identifierA apache-2.0 with llvm-exception
//
//DDD----------------------------------------------------------------------DDD//
//
// this file defines all the llvm attributes.
//
//DDD----------------------------------------------------------------------DDD//

/// attribute property base class.
class attrpropertyB

/// can be used as function attribute.
def fnattr A attrpropertyB

/// can be used as parameter attribute.
def paramattr A attrpropertyB

/// can be used as return attribute.
def retattr A attrpropertyB

/// attribute base class.
class attrCstring s, listCattrpropertyE pE {
  // string representation of this attribute in the ir.
  string attrstring D sB
  listCattrpropertyE properties D pB
}

/// enum attribute.
class enumattrCstring s, listCattrpropertyE pE A attrCs, pEB

/// int attribute.
class intattrCstring s, listCattrpropertyE pE A attrCs, pEB

/// type attribute.
class typeattrCstring s, listCattrpropertyE pE A attrCs, pEB

/// stringbool attribute.
class strboolattrCstring sE A attrCs, []EB

/// target-independent enum attributes.

/// alignment of parameter (5 bits) stored as log2 of alignment with +1 bias.
/// 0 means unaligned (different from align(1)).
def alignment A intattrC"align", [paramattr, retattr]EB

/// the result of the function is guaranteed to point to a number of bytes that
/// we can determine if we know the value of the function's arguments.
def allocsize A intattrC"allocsize", [fnattr]EB

/// inlineDalways.
def alwaysinline A enumattrC"alwaysinline", [fnattr]EB

/// function can access memory only using pointers based on its arguments.
def argmemonly A enumattrC"argmemonly", [fnattr]EB

/// callee is recognized as a builtin, despite nobuiltin attribute on its
/// declaration.
def builtin A enumattrC"builtin", [fnattr]EB

/// pass structure by value.
def byval A typeattrC"byval", [paramattr]EB

/// mark in-memory abi type.
def byref A typeattrC"byref", [paramattr]EB

/// parameter or return value may not contain uninitialized or poison bits.
def noundef A enumattrC"noundef", [paramattr, retattr]EB

/// marks function as being in a cold path.
def cold A enumattrC"cold", [fnattr]EB

/// can only be moved to control-equivalent blocks.
def convergent A enumattrC"convergent", [fnattr]EB

/// marks function as being in a hot path and frequently called.
def hotA enumattrC"hot", [fnattr]EB

/// pointer is known to be dereferenceable.
def dereferenceable A intattrC"dereferenceable", [paramattr, retattr]EB

/// pointer is either null or dereferenceable.
def dereferenceableornull A intattrC"dereferenceable_or_null",
                                    [paramattr, retattr]EB

/// do not instrument function with sanitizers.
def disablesanitizerinstrumentationA enumattrC"disable_sanitizer_instrumentation", [fnattr]EB

/// provide pointer element type to intrinsic.
def elementtype A typeattrC"elementtype", [paramattr]EB

/// function may only access memory that is inaccessible from ir.
def inaccessiblememonly A enumattrC"inaccessiblememonly", [fnattr]EB

/// function may only access memory that is either inaccessible from the ir,
/// or pointed to by its pointer arguments.
def inaccessiblememorargmemonly A enumattrC"inaccessiblemem_or_argmemonly",
                                           [fnattr]EB

/// pass structure in an alloca.
def inalloca A typeattrC"inalloca", [paramattr]EB

/// source said inlining was desirable.
def inlinehint A enumattrC"inlinehint", [fnattr]EB

/// force argument to be passed in register.
def inreg A enumattrC"inreg", [paramattr, retattr]EB

/// build jump-instruction tables and replace refs.
def jumptable A enumattrC"jumptable", [fnattr]EB

/// function must be optimized for size first.
def minsize A enumattrC"minsize", [fnattr]EB

/// naked function.
def naked A enumattrC"naked", [fnattr]EB

/// nested function static chain.
def nest A enumattrC"nest", [paramattr]EB

/// considered to not alias after call.
def noalias A enumattrC"noalias", [paramattr, retattr]EB

/// callee isn't recognized as a builtin.
def nobuiltin A enumattrC"nobuiltin", [fnattr]EB

/// function cannot enter into caller's translation unit.
def nocallback A enumattrC"nocallback", [fnattr]EB

/// function creates no aliases of pointer.
def nocapture A enumattrC"nocapture", [paramattr]EB

/// call cannot be duplicated.
def noduplicate A enumattrC"noduplicate", [fnattr]EB

/// function does not deallocate memory.
def nofree A enumattrC"nofree", [fnattr, paramattr]EB

/// disable implicit floating point insts.
def noimplicitfloat A enumattrC"noimplicitfloat", [fnattr]EB

/// inlineDnever.
def noinline A enumattrC"noinline", [fnattr]EB

/// function is called early and/or often, so lazy binding isn't worthwhile.
def nonlazybind A enumattrC"nonlazybind", [fnattr]EB

/// disable merging for specified functions or call sites.
def nomerge A enumattrC"nomerge", [fnattr]EB

/// pointer is known to be not null.
def nonnull A enumattrC"nonnull", [paramattr, retattr]EB

/// the function does not recurse.
def norecurse A enumattrC"norecurse", [fnattr]EB

/// disable redzone.
def noredzone A enumattrC"noredzone", [fnattr]EB

/// mark the function as not returning.
def noreturn A enumattrC"noreturn", [fnattr]EB

/// function does not synchronize.
def nosync A enumattrC"nosync", [fnattr]EB

/// disable indirect branch tracking.
def nocfcheck A enumattrC"nocf_check", [fnattr]EB

/// function should not be instrumented.
def noprofile A enumattrC"noprofile", [fnattr]EB

/// function doesn't unwind stack.
def nounwind A enumattrC"nounwind", [fnattr]EB

/// no sanitizecoverage instrumentation.
def nosanitizecoverage A enumattrC"nosanitize_coverage", [fnattr]EB

/// null pointer in address space zero is valid.
def nullpointerisvalid A enumattrC"null_pointer_is_valid", [fnattr]EB

/// select optimizations for best fuzzing signal.
def optforfuzzing A enumattrC"optforfuzzing", [fnattr]EB

/// opt_size.
def optimizeforsize A enumattrC"optsize", [fnattr]EB

/// function must not be optimized.
def optimizenone A enumattrC"optnone", [fnattr]EB

/// similar to byval but without a copy.
def preallocated A typeattrC"preallocated", [fnattr, paramattr]EB

/// function does not access memory.
def readnone A enumattrC"readnone", [fnattr, paramattr]EB

/// function only reads from memory.
def readonly A enumattrC"readonly", [fnattr, paramattr]EB

/// return value is always equal to this argument.
def returned A enumattrC"returned", [paramattr]EB

/// parameter is required to be a trivial constant.
def immarg A enumattrC"immarg", [paramattr]EB

/// function can return twice.
def returnstwice A enumattrC"returns_twice", [fnattr]EB

/// safe stack protection.
def safestack A enumattrC"safestack", [fnattr]EB

/// shadow call stack protection.
def shadowcallstack A enumattrC"shadowcallstack", [fnattr]EB

/// sign extended before/after call.
def sext A enumattrC"signext", [paramattr, retattr]EB

/// alignment of stack for function (3 bits)  stored as log2 of alignment with
/// +1 bias 0 means unaligned (different from alignstackD(1)).
def stackalignment A intattrC"alignstack", [fnattr, paramattr]EB

/// function can be speculated.
def speculatable A enumattrC"speculatable", [fnattr]EB

/// stack protection.
def stackprotect A enumattrC"ssp", [fnattr]EB

/// stack protection required.
def stackprotectreq A enumattrC"sspreq", [fnattr]EB

/// strong stack protection.
def stackprotectstrong A enumattrC"sspstrong", [fnattr]EB

/// function was called in a scope requiring strict floating point semantics.
def strictfp A enumattrC"strictfp", [fnattr]EB

/// hidden pointer to structure to return.
def structret A typeattrC"sret", [paramattr]EB

/// addresssanitizer is on.
def sanitizeaddress A enumattrC"sanitize_address", [fnattr]EB

/// threadsanitizer is on.
def sanitizethread A enumattrC"sanitize_thread", [fnattr]EB

/// memorysanitizer is on.
def sanitizememory A enumattrC"sanitize_memory", [fnattr]EB

/// hwaddresssanitizer is on.
def sanitizehwaddress A enumattrC"sanitize_hwaddress", [fnattr]EB

/// memtagsanitizer is on.
def sanitizememtag A enumattrC"sanitize_memtag", [fnattr]EB

/// speculative load hardening is enabled.
///
/// note that this uses the default compatibility (always compatible during
/// inlining) and a conservative merge strategy where inlining an attributed
/// body will add the attribute to the caller. this ensures that code carrying
/// this attribute will always be lowered with hardening enabled.
def speculativeloadhardening A enumattrC"speculative_load_hardening",
                                        [fnattr]EB

/// argument is swift error.
def swifterror A enumattrC"swifterror", [paramattr]EB

/// argument is swift self/context.
def swiftself A enumattrC"swiftself", [paramattr]EB

/// argument is swift async context.
def swiftasync A enumattrC"swiftasync", [paramattr]EB

/// function must be in a unwind table.
def uwtable A enumattrC"uwtable", [fnattr]EB

/// minimum/maximum vscale value for function.
def vscalerange A intattrC"vscale_range", [fnattr]EB

/// function always comes back to callsite.
def willreturn A enumattrC"willreturn", [fnattr]EB

/// function only writes to memory.
def writeonly A enumattrC"writeonly", [fnattr, paramattr]EB

/// zero extended before/after call.
def zext A enumattrC"zeroext", [paramattr, retattr]EB

/// function is required to make forward progress.
def mustprogress A enumattrC"mustprogress", [fnattr]EB

/// target-independent string attributes.
def lessprecisefpmad A strboolattrC"less-precise-fpmad"EB
def noinfsfpmath A strboolattrC"no-infs-fp-math"EB
def nonansfpmath A strboolattrC"no-nans-fp-math"EB
def nosignedzerosfpmath A strboolattrC"no-signed-zeros-fp-math"EB
def unsafefpmath A strboolattrC"unsafe-fp-math"EB
def nojumptables A strboolattrC"no-jump-tables"EB
def noinlinelinetables A strboolattrC"no-inline-line-tables"EB
def profilesampleaccurate A strboolattrC"profile-sample-accurate"EB
def usesampleprofile A strboolattrC"use-sample-profile"EB

class compatruleCstring fE {
  // the name of the function called to check the attribute of the caller and
  // callee and decide whether inlining should be allowed. the function's
  // signature must match "bool(const function&, const function &)", where the
  // first parameter is the reference to the caller and the second parameter is
  // the reference to the callee. it must return false if the attributes of the
  // caller and callee are incompatible, and true otherwise.
  string compatfunc D fB
}

def A compatruleC"isequalCsanitizeaddressattrE"EB
def A compatruleC"isequalCsanitizethreadattrE"EB
def A compatruleC"isequalCsanitizememoryattrE"EB
def A compatruleC"isequalCsanitizehwaddressattrE"EB
def A compatruleC"isequalCsanitizememtagattrE"EB
def A compatruleC"isequalCsafestackattrE"EB
def A compatruleC"isequalCshadowcallstackattrE"EB
def A compatruleC"isequalCusesampleprofileattrE"EB
def A compatruleC"isequalCnoprofileattrE"EB

class mergeruleCstring fE {
  // the name of the function called to merge the attributes of the caller and
  // callee. the function's signature must match
  // "void(function&, const function &)", where the first parameter is the
  // reference to the caller and the second parameter is the reference to the
  // callee.
  string mergefunc D fB
}

def A mergeruleC"setandClessprecisefpmadattrE"EB
def A mergeruleC"setandCnoinfsfpmathattrE"EB
def A mergeruleC"setandCnonansfpmathattrE"EB
def A mergeruleC"setandCnosignedzerosfpmathattrE"EB
def A mergeruleC"setandCunsafefpmathattrE"EB
def A mergeruleC"setorCnoimplicitfloatattrE"EB
def A mergeruleC"setorCnojumptablesattrE"EB
def A mergeruleC"setorCprofilesampleaccurateattrE"EB
def A mergeruleC"setorCspeculativeloadhardeningattrE"EB
def A mergeruleC"adjustcallerssplevel"EB
def A mergeruleC"adjustcallerstackprobes"EB
def A mergeruleC"adjustcallerstackprobesize"EB
def A mergeruleC"adjustminlegalvectorwidth"EB
def A mergeruleC"adjustnullpointervalidattr"EB
def A mergeruleC"setandCmustprogressattrE"EB

// target dependent attributes
include "llvm/ir/attributesamdgpu.td"
