module AresMUSH
  module Handles
    class CharConnectedEventHandler
      def on_event(event)
        char = event.char
        return if !char.handle
        
         AresMUSH.with_error_handling(event.client, "Syncing handle with AresCentral.") do
          connector = AresCentral::AresConnector.new
        
          Global.logger.info "Updating handle for #{char.handle.handle_id}"
          response = connector.sync_handle(char.handle.handle_id, char.name, char.id)

          if (response.is_success?)
            if (response.data["linked"])
              Global.logger.debug response
              char.update(pose_quote_color: response.data["quote_color"])
              char.update(page_autospace: response.data["page_autospace"])
              char.update(page_color: response.data["page_color"])
              char.update(pose_autospace: response.data["autospace"])
              char.update(timezone: response.data["timezone"])
              char.handle.update(friends: response.data["friends"])
              event.client.emit_success t('handles.handle_synced')              
            else
              char.handle.delete
              event.client.emit_success t('handles.handle_no_longer_linked')
            end
          else
            raise "Response failed: #{response}"
          end
        end   
      end
    end
  end
end