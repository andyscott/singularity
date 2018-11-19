package org.apache.tools.ant

import java.lang.ClassLoader

import types._
import taskdefs._

class BuildException(message: String) extends Exception(message)
class AntClassLoader extends ClassLoader {
  def getClasspath(): String = ???
}

class Task {
  def getProject(): Project = ???
  def init(): Unit = ???
  def execute(): Unit = ???
}

class Project

package types {
  object CommandLine {
    class Argument {
      def setValue(value: String): Unit = ???
    }
  }
  class Path(p: Project, path: String) {
    def list(): Array[String] = ???
  }
}

package taskdefs {
  class Java extends Task {
    def bindToOwner(value: Any): Unit = ???
    def setFork(value: Boolean): Unit = ???
    def setClassname(value: String): Unit = ???
    def setClasspath(value: Path): Unit = ???
    def createArg(): CommandLine.Argument = ???
    def createJvmarg(): CommandLine.Argument = ???
    def executeJava(): Int = ???
  }
}
