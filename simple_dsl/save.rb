class PersistAnswers < WEBrick::HTTPServlet::AbstractServlet

  def do_POST(request, response)
    status, content_type, body = save_answers(request)

    response.status = status
    response['Content-Type'] = content_type
    response.body = body
  end

  # Save POST request into a text file
  def save_answers(request)
    # Check if the user provided a name
    if (filename = request.query['first_name'] )
      f = File.open("save-#{filename}.#{Time.now.strftime('%H%M%S')}.txt", 'w')

      # Iterate over every POST'ed value and persist it to file
      request.query.collect { | key, value | f.write("#{key}: #{value}\n") }
      f.close
    end

    # Return OK (200), content-type: text/plain, and a plain-text "Saved! Thank you." notice
    return 200, "text/plain", "Saved! Thank you."
  end
end
