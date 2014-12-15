module RestServiceModule
  class HelloService
    def self.index()
      class_name = self.name.split('::').last
      file = File.open("./simple_dsl/#{class_name.downcase}.rb", "w")
      template = File.open("./simple_dsl/template.txt")
      file.write("class #{class_name.capitalize} < B")
      IO.copy_stream(template, file)
      file.write("end")
      file.close
      return JSON.generate({:data => 'Hello World'})
    end
 
    def self.greet(args=[])
      return JSON.generate({:data => "Hello #{args.join(' ')}"})
    end
  end
end