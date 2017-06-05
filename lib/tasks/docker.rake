namespace :docker do
  desc "Push docker images to DockerHub"
  task :push do
    TAG = `git rev-parse --short HEAD`.strip

    puts "Building Docker image"
    sh "docker build -t tzumby/rails-app:#{TAG} ."

    IMAGE_ID = `docker images | grep tzumby\/rails-app | head -n1 | awk '{print $3}'`.strip

    puts "Tagging latest image"
    sh "docker tag #{IMAGE_ID} tzumby/rails-app:latest"

    puts "Pushing Docker image"
    sh "docker push tzumby/rails-app:#{TAG}"
    sh "docker push tzumby/rails-app:latest"

    puts "Done"
  end

end
