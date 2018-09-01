val scala = for (arg <- args if arg == "hello") yield arg

scala.foreach(println)
