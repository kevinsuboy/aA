require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User
    attr_accessor :id, :fname, :lname
    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM users")
        data.map {|datum| User.new(datum)}
    end

    #options is coming back as a hash  becuase of the self.results_as_hash
    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def self.find_by_name(fname,lname)
        
        user = PlayDBConnection.instance.execute(<<-SQL, fname, lname)
        SELECT 
            *
        FROM
            users
        WHERE 
            fname = ? and
            lname = ?
        SQL

        User.new(user.first)
    end
    def authored_questions
        
    end
    def authored_replies
    end
    # def self.find_by_id(id)
        
    # end

end

class Question
        attr_accessor :id, :title, :body, :user_id
    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM questions")
        data.map {|datum| Question.new(datum)}
    end
    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end
    def self.find_by_id(id)
        q = PlayDBConnection.instance.execute(<<-SQL,id)
        SELECT
            *
        FROM
            questions
        WHERE id = ?
        SQL
        Question.new(q.first)
    end
    def self.find_by_author(author_id)
        questions = PlayDBConnection.instance.execute(<<-SQL,author_id)
        SELECT
            *
        FROM
            questions
        WHERE user_id = ?
        SQL
        questions.map { |question| Question.new(question)}      
    end
    def author
        name = PlayDBConnection.instance.execute(<<-SQL,@user_id)
        SELECT
            fname,lname
        FROM
            users
        WHERE id = ?
        SQL
        p name
        "#{name[0]['fname']} #{name[0]['lname']}"
    end
    def replies
    end
end

class Reply
        attr_accessor :id, :question_id, :parent_id, :user_id, :body
    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM replies")
        data.map {|datum| Reply.new(datum)}
    end
    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @user_id = options['user_id']
        @body = options['body']
    end
    def self.find_by_id(id)
        q = PlayDBConnection.instance.execute(<<-SQL,id)
        SELECT
            *
        FROM
            replies
        WHERE id = ?
        SQL
        Reply.new(q.first)
    end
    
end

if __FILE__ == $PROGRAM_NAME
# User.all.each do |user|
#     print " #{user.id} #{user.fname} #{user.lname}"
#     puts " "
# end

# Question.all.each do |question|
#     print "#{question.id} #{question.title} #{question.body}"
#     puts " "
# end
    p User.find_by_name('Jimmy', 'Bob')
    p Question.find_by_id(1)

    Reply.all.each do |reply|
        print "#{reply.id} #{reply.question_id} #{reply.parent_id} #{reply.user_id} #{reply.body}"
            puts " "
    end
    # ------------- Queries --------------
    # --- EASY ----
    Question.find_by_author_id(author_id)
    Reply.find_by_user_id(user_id)
    Reply.find_by_question_id(question_id)
    # All replies to the question at any depth.
    User.find_by_name(fname, lname)
    user_inst.authored_questions
    # (use Question::find_by_author_id)
    user_inst.authored_replies
    # (use Reply::find_by_user_id)
    q_inst.author
    q_inst.replies
    # (use Reply::find_by_question_id)
    reply_inst.author
    reply_inst.question
    reply_inst.parent_reply
    reply_inst.child_replies


end