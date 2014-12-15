class WebForm < WEBrick::HTTPServlet::AbstractServlet

  # Process the request, return response
  def do_GET(request, response)
    status, content_type, body = print_questions(request)

    response.status = status
    response['Content-Type'] = content_type
    response.body = body
  end

  # Construct the return HTML page
  def print_questions(request)
    html   = "<html><body><form method='POST' action='/save'>"
    html += "Name: <input type='textbox' name='first_name' /><br /><br />";

    # dbh = DBI.connect("DBI:Mysql:webarchive:localhost", "root", "pass")
    # sth = dbh.execute("SELECT headline, story, id FROM yahoo_news where date >= '2004-12-01' and date <= '2005-01-01'")
    sth = [{'headline' => "headline1", "story" => "story1", "id" => 1}, {'headline' => "headline2", "story" => "story2", "id" => 2}, {'headline' => "headline3", "story" => "story3", "id" => 3}]
      # iterate over every returned news-story from the database
      sth.each do |row|
          html += "<b>#{row['headline']}</b><br />\n"
          html += "#{row['story']}<br />\n"
          html += "<input type='textbox' name='#{row['id']}' /><br /><br />\n"
      end
      #sth.finish

    html += "<input type='submit'></form></body></html>"

    # Return OK (200), content-type: text/html, followed by the HTML itself
    return 200, "text/html", html
  end
end