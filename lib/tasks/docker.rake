namespace :docker do
  desc "Push the latest docker image to DockerHub"
  task push_image: :environment do
    TAG = `git rev-parse --short HEAD`
    puts "Building Docker image"
    sh "docker build -t tzumby/rails-kube-demo:#{TAG} ."

    puts "Pushing Docker image"
    sh "docker push tzumby/rails-kube-demo:#{TAG}"

    puts "Done"
  end

end
