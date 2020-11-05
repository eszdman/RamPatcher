#include <jni.h>
#include <string>
#include <iostream>
//
// Created by Eszdman on 01.11.2020.
//

int main(){
    std::cout<<"kekele";
}
extern "C"
JNIEXPORT jlong JNICALL
Java_com_eszdman_rampatcher_PatcherSession_getTestAddr(JNIEnv *env, jobject thiz) {
    return (jlong)(char*)&Java_com_eszdman_rampatcher_PatcherSession_getTestAddr;
}

extern "C"
JNIEXPORT void JNICALL
Java_com_eszdman_rampatcher_GetGcamPointer_PointerGetterMethodAsLongType(JNIEnv *env, jclass clazz) {
    // TODO: implement Pointer()
}
extern "C"
JNIEXPORT void JNICALL
Java_com_eszdman_rampatcher_GetGcamPointer_VoidTest(JNIEnv *env, jclass clazz) {
    int k =10;
    k =0;
}