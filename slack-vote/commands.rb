module SlackVote
  module Commands
    class Ping < SlackRubyBot::Commands::Base
      command 'ping' do |client, data, _match|
        client.say(channel: data.channel, text: 'pong')
      end

      command 'list' do |client, data, _match|
        active_list = FiteList.find_by(active: true)
        if active_list.nil?
          text = 'Sorry, there are no active fites!'
        else
          fites = active_list.fites
          fites_view = fites.map do |fite|
            left_votes = fite.votes.where(side: "left").count
            right_votes = fite.votes.where(side: "right").count
            "*#{fite.fite_position}:* #{fite.left_side} (#{left_votes}) _vs_ #{fite.right_side} (#{right_votes})"
          end.join("\n")

          text = <<~END
          *#{active_list.title}*
          #{fites_view}
          END
        client.say(channel: data.channel, text: text)
        end
      end

      match(/vote (?<pos>\d+) (?<side>left|right)/i) do |client, data, match|
        id = data["user"]
        fite_list = FiteList.find_by(active: true)
        if fite_list.present?
          fite = fite_list.fites.find_by(fite_position: match["pos"])
          unless (fite.nil?)
            vote = fite.votes.new(slack_id: id, side: match["side"])
            if vote.valid?
              vote.save!
              name_side = match["side"] == "right" ? fite.right_side : fite.left_side
              text = "you voted for *#{name_side}* in #{fite.left_side} vs #{fite.right_side}!"
            else
              text = 'That is not a valid vote'
            end

          else
            text = 'invalid fite position'
          end
          client.say(channel: data.channel, text: text)
        else
          client.say(channel: data.channel, text: 'oops')
        end
      end
    end
  end
end
