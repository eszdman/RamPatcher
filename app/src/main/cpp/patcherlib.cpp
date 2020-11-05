#include <jni.h>
#include <string>
#include <iostream>
#include <dlfcn.h>
#include <unistd.h>
#include <sys/mman.h>
bool compareTile(jlong addr, const uint8_t* array, int sizeArr);
extern "C" JNIEXPORT jstring JNICALL
Java_com_eszdman_rampatcher_PatcherSession_stringFromJNI(
        JNIEnv* env,
        jobject /* this */) {
    std::string hello = "Hello from C++";
    return env->NewStringUTF(hello.c_str());
}
int change_page_permissions_of_address(jlong addr) {
    // Move the pointer to the page boundary
    int page_size = getpagesize();
    addr -= (jlong)addr%page_size;
    if(mprotect((void*)addr, page_size, PROT_READ | PROT_WRITE | PROT_EXEC) == -1) {
        return -1;
    }
    return 0;
}
std::string getRegion(int regionSize, jlong addr){
    std::string output;
    char buff[3];
    output+="region:"+std::to_string(regionSize)+" addr:"+std::to_string(addr)+" found:";
    for(jlong ind =-regionSize+addr;ind<regionSize+addr;ind++){
        sprintf(buff,"%X",*(uint8_t*)(char*)(ind));
        if(buff[1] == 0){
            buff[1] = '0';
            buff[2] = 0;
        }
        output+=buff;
    }
    return output;
}
extern "C"
JNIEXPORT jstring JNICALL
Java_com_eszdman_rampatcher_PatcherSession_readRegion(JNIEnv *env, jobject thiz, jlong addr,
                                                      jint size) {
    return env->NewStringUTF(getRegion(size,addr).c_str());
}
extern "C"
JNIEXPORT jstring JNICALL
Java_com_eszdman_rampatcher_PatcherSession_readRegionRight(JNIEnv *env, jobject thiz, jlong addr,
                                                           jint size) {
    std::string output;
    char buff[3];
    output+="region:"+std::to_string(size)+" addr:"+std::to_string(addr)+" found:";
    for(jlong ind =addr;ind<size+addr;ind++){

        sprintf(buff,"%X",*(uint8_t*)(char*)(ind));
        if(buff[1] == 0){
            buff[1] = '0';
            buff[2] = 0;
        }
        output+=buff;
    }
    return env->NewStringUTF(output.c_str());
}
extern "C"
JNIEXPORT void JNICALL
Java_com_eszdman_rampatcher_PatcherSession_setBytes(JNIEnv *env, jobject thiz, jlong addr,
                                                    jbyteArray in) {
    int size2 = env->GetArrayLength(in);
    auto* inp = (uint8_t*)(env->GetByteArrayElements(in, nullptr));
    if(change_page_permissions_of_address(addr) == -1) {
        fprintf(stderr, "Error while changing page permissions of addr: %s\n", strerror(errno));
    }
    for(int i =0; i<size2;i++){
        *(uint8_t*)(addr+i) = inp[i];
    }
}
extern "C"
JNIEXPORT void JNICALL
Java_com_eszdman_rampatcher_PatcherSession_setFloat(JNIEnv *env, jobject thiz, jlong addr,
                                                    jfloat in) {
        *(jfloat*)(char*)(addr) = in;
}
void* libhandle;
extern "C"
JNIEXPORT jlong JNICALL
Java_com_eszdman_rampatcher_PatcherSession_getLibraryOffset(JNIEnv *env, jobject thiz, jstring export_name) {
    void*addr = dlsym(libhandle,env->GetStringUTFChars(export_name, nullptr));
    return (jlong)(char*)addr;
}
extern "C"
JNIEXPORT void JNICALL
Java_com_eszdman_rampatcher_PatcherSession_setDouble(JNIEnv *env, jobject thiz, jlong addr,
                                                     jdouble in) {
    *(jdouble*)(char*)(addr) = in;
}extern "C"
JNIEXPORT void JNICALL
Java_com_eszdman_rampatcher_PatcherSession_setInt(JNIEnv *env, jobject thiz, jlong addr, jint in) {
    *(jint*)(char*)(addr) = in;
}extern "C"
JNIEXPORT void JNICALL
Java_com_eszdman_rampatcher_PatcherSession_test(JNIEnv *env, jobject thiz) {

}extern "C"
JNIEXPORT void JNICALL
Java_com_eszdman_rampatcher_PatcherSession_PatchDone(JNIEnv *env, jobject thiz) {
    dlclose(libhandle);
}extern "C"
JNIEXPORT void JNICALL
Java_com_eszdman_rampatcher_PatcherSession_ReadyToPatch(JNIEnv *env, jobject thiz,
                                                        jstring libname) {
    libhandle = dlopen((env->GetStringUTFChars(libname, nullptr)), RTLD_GLOBAL);
}