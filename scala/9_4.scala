import java.io.{File, PrintWriter}

def withPrintWriter(file: File)(op: PrintWriter => Unit) = {
  val writer =new PrintWriter(file)
  try{
    op(writer) // PrintWriterを貸してる
  }
  finally {
    writer.close()
  }
}

withPrintWriter(
  new File("data.txt")
) { // 制御構造を浸かっているように見えるから引数1つのときは中括弧使える
  writer => writer.println(new java.util.Date)
}
