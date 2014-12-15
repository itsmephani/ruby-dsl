module RestServiceModule
  class HelloService
    def self.index()
      return JSON.generate({:data => 'Hello World'})
    end
 
    def self.greet(args=[])
      return JSON.generate({:data => "Hello #{args.join(' ')}"})
    end
  end
end